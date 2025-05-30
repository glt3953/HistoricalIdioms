import Foundation
import SwiftUI

class IdiomsViewModel: ObservableObject {
    @Published var idioms: [Idiom] = Idiom.examples
    @Published var currentIndex: Int = 0
    
    var currentIdiom: Idiom {
        idioms[currentIndex]
    }
    
    func nextIdiom() {
        withAnimation {
            currentIndex = (currentIndex + 1) % idioms.count
        }
    }
    
    func previousIdiom() {
        withAnimation {
            currentIndex = (currentIndex - 1 + idioms.count) % idioms.count
        }
    }
    
    // 在实际应用中，可以从JSON文件或网络加载数据
    func loadIdioms() {
        // 这里使用示例数据，实际应用中可以从JSON加载
        // idioms = loadFromJSON("idioms")
    }
}