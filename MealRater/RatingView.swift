import SwiftUI

struct RatingView: View {
    @Binding var rating: Int?
    @Environment(\.dismiss) var dismiss

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
                    dismiss()
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
    RatingView(rating: .constant(3))
}
