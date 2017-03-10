import Foundation
import QueryKit
import Domain
import RealmSwift
import Realm

final class RMLocation: Object {
    dynamic var latitude: Double = 0
    dynamic var longitude: Double = 0
}

extension RMLocation {
    static var latitude: Attribute<Double> { return Attribute("latitude")}
    static var longitude: Attribute<Double> { return Attribute("longitude")}
}

extension RMLocation: DomainConvertibleType {
    func asDomain() -> Location {
        return Location(latitude: latitude,
                        longitude: longitude)
    }
}

extension Location: RealmRepresentable {
    internal var uid: Int {
        return 0
    }

    func asRealm() -> RMLocation {
        return RMLocation.build { object in
            object.latitude = latitude
            object.longitude = longitude
        }
    }
}
