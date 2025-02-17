import SwiftData
import SwiftUI

@Model
class Meal: Identifiable {
    var restaurantName: String
    var dishName: String
    var rating: Int?

    init(restaurantName: String, dishName: String, rating: Int? = nil) {
        self.restaurantName = restaurantName
        self.dishName = dishName
        self.rating = rating
    }
}
