import SwiftUI
import SwiftData

struct RatingView: View {
    @Binding var rating: Int?
    @Binding var restaurantName: String // You'll likely need to bind these from ContentView as well, if you want to save them
    @Binding var dishName: String      // Add these @Bindings if you intend to save restaurantName and dishName
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext // Add this line to access the ModelContext

    var body: some View {
        VStack {
            Text("Rate this Meal")
                .font(.title)
                .padding()

            HStack {
                ForEach(1...5, id: \.self) { number in
                    Button(action: {
                        rating = number
                    }) {
                        Text("\(number)")
                            .frame(minWidth: 40, maxWidth: 40, minHeight: 40, maxHeight: 40)
                            .foregroundColor(rating == number ? .white : .blue)
                            .background(rating == number ? Color.blue : Color.clear)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                }
            }
            .padding(.vertical)

            HStack {
                Button("Cancel") {
                    rating = nil
                    dismiss()
                }
                .foregroundColor(.red)

                Button("Save") {
                    if let ratingValue = rating {
                        // Assuming you have a @Model class named 'Meal' defined (e.g., in Meal.swift)
                        let newMeal = Meal(restaurantName: restaurantName, dishName: dishName, rating: ratingValue) // Create a Meal object
                        modelContext.insert(newMeal) // Insert it into the ModelContext

                        do {
                            try modelContext.save() // Save the context (and data to SwiftData)
                            print("Meal data saved using SwiftData!") // Confirmation message in console
                        } catch {
                            print("Error saving meal data: \(error)") // Print error if saving fails
                        }
                    }
                    dismiss() // Dismiss the rating sheet after saving (or attempting to)
                }
            }
            .padding(.vertical)


            Spacer()
        }
        .padding()
        .presentationDetents([.medium, .large])
    }
}

#Preview {
    RatingView(rating: .constant(3), restaurantName: .constant("Preview Restaurant"), dishName: .constant("Preview Dish")) // Added preview data for bindings
}
