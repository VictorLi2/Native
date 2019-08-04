/// Copyright (c) 2017 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import AVFoundation

class ListenViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forward15Button: UIButton!
    @IBOutlet weak var back15Button: UIButton!
    @IBOutlet weak var countUpLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    
    // MARK: Properties
    var song: Song?
    
    // MARK: AVAudio properties
    var engine = AVAudioEngine()
    var player = AVAudioPlayerNode()
    var rateEffect = AVAudioUnitTimePitch()
    
    var audioFile: AVAudioFile? {
        didSet {
            if let audioFile = audioFile {
                audioLengthSamples = audioFile.length
                audioFormat = audioFile.processingFormat
                audioSampleRate = Float(audioFormat?.sampleRate ?? 44100)
                audioLengthSeconds = Float(audioLengthSamples) / audioSampleRate
            }
        }
    }
    var audioFileURL: URL? {
        didSet {
            if let audioFileURL = audioFileURL {
                audioFile = try? AVAudioFile(forReading: audioFileURL)
            }
        }
    }
    var audioBuffer: AVAudioPCMBuffer?
    
    // MARK: other properties
    var audioFormat: AVAudioFormat?
    var audioSampleRate: Float = 0
    var audioLengthSeconds: Float = 0
    var audioLengthSamples: AVAudioFramePosition = 0
    var needsFileScheduled = true
    let volumeSliderValues: [Float] = [0.5, 1.0, 1.25, 1.5, 1.75, 2.0, 2.5, 3.0]
    var rateValue: Float = 1.0 {
        didSet {
            rateEffect.rate = rateValue
        }
    }
    var updater: CADisplayLink?
    var currentFrame: AVAudioFramePosition {
        guard let lastRenderTime = player.lastRenderTime,
            let playerTime = player.playerTime(forNodeTime: lastRenderTime) else {
                return 0
        }
        
        return playerTime.sampleTime
    }
    var seekFrame: AVAudioFramePosition = 0
    var currentPosition: AVAudioFramePosition = 0
    let pauseImageHeight: Float = 26.0
    let minDb: Float = -80.0
    
    enum TimeConstant {
        static let secsPerMin = 60
        static let secsPerHour = TimeConstant.secsPerMin * 60
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.setNavigationBarHidden(false, animated: false)

        songTitle.text = song?.title
        artist.text = song?.artist
        albumArt.image = song?.albumArt
        
        setupVolumeSlider()
        countUpLabel.text = formatted(time: 0)
        countDownLabel.text = formatted(time: audioLengthSeconds)
        setupAudio()
        
        updater = CADisplayLink(target: self, selector: #selector(updateUI))
        updater?.add(to: .current, forMode: RunLoop.Mode.default)
        updater?.isPaused = true
    }
}

// MARK: - Actions
extension ListenViewController {
    @IBAction func didChangeVolumeValue(_ sender: UISlider) {
        let index = round(sender.value)
        volumeSlider.setValue(Float(index), animated: false)
        rateValue = volumeSliderValues[Int(index)]
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if currentPosition >= audioLengthSamples {
            updateUI()
        }
        
        if player.isPlaying {
            disconnectVolumeTap()
            updater?.isPaused = true
            player.pause()
        } else {
            updater?.isPaused = false
            connectVolumeTap()
            if needsFileScheduled {
                needsFileScheduled = false
                scheduleAudioFile()
            }
            player.play()
        }
    }
    
    @IBAction func forward15Tapped(_ sender: UIButton) {
        guard let _ = player.engine else { return }
        seek(to: 15.0)
    }
    
    @IBAction func back15Tapped(_ sender: UIButton) {
        guard let _ = player.engine else { return }
        needsFileScheduled = false
        seek(to: -10.0)
    }

    @objc func updateUI() {
        currentPosition = currentFrame + seekFrame
        currentPosition = max(currentPosition, 0)
        currentPosition = min(currentPosition, audioLengthSamples)
        
        progressBar.progress = Float(currentPosition) / Float(audioLengthSamples)
        let time = Float(currentPosition) / audioSampleRate
        countUpLabel.text = formatted(time: time)
        countDownLabel.text = formatted(time: audioLengthSeconds - time)
        
        if currentPosition >= audioLengthSamples {
            player.stop()
            updater?.isPaused = true
            playPauseButton.isSelected = false
            disconnectVolumeTap()
        }
    }
}

// MARK: - Display related
extension ListenViewController {
    func setupVolumeSlider() {
        let numSteps = volumeSliderValues.count-1
        volumeSlider.minimumValue = 0
        volumeSlider.maximumValue = Float(numSteps)
        volumeSlider.isContinuous = true
        volumeSlider.setValue(1.0, animated: false)
        rateValue = 1.0
    }
    
    func formatted(time: Float) -> String {
        var secs = Int(ceil(time))
        var hours = 0
        var mins = 0
        
        if secs > TimeConstant.secsPerHour {
            hours = secs / TimeConstant.secsPerHour
            secs -= hours * TimeConstant.secsPerHour
        }
        
        if secs > TimeConstant.secsPerMin {
            mins = secs / TimeConstant.secsPerMin
            secs -= mins * TimeConstant.secsPerMin
        }
        
        var formattedString = ""
        if hours > 0 {
            formattedString = "\(String(format: "%02d", hours)):"
        }
        formattedString += "\(String(format: "%02d", mins)):\(String(format: "%02d", secs))"
        return formattedString
    }
}

// MARK: - Audio
extension ListenViewController {
    func setupAudio() {
        audioFileURL  = Bundle.main.url(forResource: song?.title, withExtension: "mp4")
        
        engine.attach(player)
        engine.attach(rateEffect)
        engine.connect(player, to: rateEffect, format: audioFormat)
        engine.connect(rateEffect, to: engine.mainMixerNode, format: audioFormat)
        
        engine.prepare()
        
        do {
            try engine.start()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func scheduleAudioFile() {
        guard let audioFile = audioFile else { return }
        
        seekFrame = 0
        player.scheduleFile(audioFile, at: nil) { [weak self] in
            self?.needsFileScheduled = true
        }
    }
    
    func connectVolumeTap() {
        let format = engine.mainMixerNode.outputFormat(forBus: 0)
        engine.mainMixerNode.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, when in
            
            guard let channelData = buffer.floatChannelData,
                let updater = self.updater else {
                    return
            }
            
            let channelDataValue = channelData.pointee
            let channelDataValueArray = stride(from: 0,
                                               to: Int(buffer.frameLength),
                                               by: buffer.stride).map{ channelDataValue[$0] }
            let ms = channelDataValueArray.map{ $0 * $0 }.reduce(0, +) / Float(buffer.frameLength)
            let rms = sqrt(ms)
            let avgPower = 20 * log10(rms)
            let meterLevel = self.scaledPower(power: avgPower)
            
//            DispatchQueue.main.async {
//                self.volumeMeterHeight.constant = !updater.isPaused ? CGFloat(min((meterLevel * self.pauseImageHeight),
//                                                                                  self.pauseImageHeight)) : 0.0
//            }
        }
    }
    
    func scaledPower(power: Float) -> Float {
        guard power.isFinite else { return 0.0 }
        
        if power < minDb {
            return 0.0
        } else if power >= 1.0 {
            return 1.0
        } else {
            return (abs(minDb) - abs(power)) / abs(minDb)
        }
    }
    
    func disconnectVolumeTap() {
        engine.mainMixerNode.removeTap(onBus: 0)
        //volumeMeterHeight.constant = 0
    }
    
    func seek(to time: Float) {
        guard let audioFile = audioFile,
            let updater = updater else {
                return
        }
        
        seekFrame = currentPosition + AVAudioFramePosition(time * audioSampleRate)
        seekFrame = max(seekFrame, 0)
        seekFrame = min(seekFrame, audioLengthSamples)
        currentPosition = seekFrame
        
        player.stop()
        
        if currentPosition < audioLengthSamples {
            updateUI()
            needsFileScheduled = false
            
            player.scheduleSegment(audioFile, startingFrame: seekFrame, frameCount: AVAudioFrameCount(audioLengthSamples - seekFrame), at: nil) { [weak self] in
                self?.needsFileScheduled = true
            }
            
            if !updater.isPaused {
                player.play()
            }
        }
    }
    
}
