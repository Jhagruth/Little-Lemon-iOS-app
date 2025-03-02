import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var model = Model()
    @State var tabSelection = 0
    @State var previousTabSelection = -1 // any invalid value
    
    
    var body: some View {
        TabView (selection: $model.tabViewSelectedIndex){
            LocationsView()
                .tag(0)
                .tabItem {
                        Label("Locations", systemImage: "fork.knife")
                }
                .onAppear() {
                    tabSelection = 0
                }
            
            OurDishes()
                .tag(1)
                .tabItem {
                        Label("Our Dishes", systemImage: "fork.knife.circle")
                }
                .onAppear() {
                    tabSelection = 1
                }
            
            ReservationView()
                .tag(2)
                .tabItem {
                        Label("Reservation", systemImage: "square.and.pencil")
                }
                .onAppear() {
                    tabSelection = 2
                }
        }
        .id(tabSelection)
        .environmentObject(model)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Model())
    }
}




