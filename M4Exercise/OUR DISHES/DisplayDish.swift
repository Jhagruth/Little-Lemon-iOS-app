//
// DisplayDish.swift



import SwiftUI


struct DisplayDish: View {
    @ObservedObject private var dish:Dish
    init(_ dish:Dish) {
        self.dish = dish
    }
    
    var body: some View {        
        HStack {
            Text(dish.name ?? "Unavailable")
                Spacer()
            
            Text("$\(String(format: "%.2f", dish.price))")
                .font(.callout)
                .fontWeight(.bold)
                .monospaced()
        }
        .padding(.vertical, 10)
        .contentShape(Rectangle()) // keep this code
    }
}

struct DisplayDish_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    static var previews: some View {
        DisplayDish(oneDish())
    }
    static func oneDish() -> Dish {
        let dish = Dish(context: context)
        dish.name = "Hummus"
        dish.price = 10
        dish.size = "Extra Large"
        return dish
    }
}

