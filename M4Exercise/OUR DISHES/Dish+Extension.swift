import Foundation
import SwiftUI
import CoreData


extension Dish {
    
    static func createDishesFrom(menuItems:[MenuItem], _ context:NSManagedObjectContext) {
        menuItems.forEach {menuItem in
            if let dishExists = Dish.exists(name: menuItem.title, context) {
                if !dishExists {
                    
                    let newDish = Dish(context: context)
                    newDish.name = menuItem.title
                    newDish.price = Float(menuItem.price) ?? 0.00
                    
                    do {
                        //try context.save()
                        print("Dish \(menuItem.title) added successfully!")
                    } catch {
                        print("Failed to save new dish: \(error)")
                    }
                } else {
                    print("Dish \(menuItem.title) already exists.")
                }
            }
        }
    }
}
