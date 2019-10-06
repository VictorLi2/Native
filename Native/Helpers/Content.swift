import UIKit

protocol Content {
    //MARK: Properties
    var contentType: ContentType { get }
    var id: String { get }
    var title: String { get set }
    var source: String { get set }
    var image: UIImage { get set }
}

enum ContentType {
    case read, watch, listen, write
}
