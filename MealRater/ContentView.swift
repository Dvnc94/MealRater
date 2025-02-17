import SwiftUI

struct ContentView: View {
    @State private var restaurantName = ""
    @State private var dishName = ""
    @State private var rating: Int? = nil
    @State private var isRatingViewPresented = false

    var body: some View {
        VStack {
            HStack {
                Text("Restaurant:")
                TextField("", text: $restaurantName)
                    .textFieldStyle(.roundedBorder)
            }

            HStack {
                Text("Dish:")
                TextField("", text: $dishName)
                    .textFieldStyle(.roundedBorder)
            }
            HStack {
                Text("Rating:")
                if let ratingValue = rating {
                    Text("\(ratingValue) stars")
                } else {
                    Text("No rating yet")
                }
            }


            Button("Rate Meal") {
                isRatingViewPresented = true
            }
            .sheet(isPresented: $isRatingViewPresented) {
                RatingView(rating: $rating, restaurantName: $restaurantName, dishName: $dishName)
            }


        }
        .padding()
    }
}

#Preview {
    ContentView()
}
