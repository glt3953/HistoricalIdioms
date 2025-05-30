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
    
    // 从JSON文件加载数据
    func loadIdioms() {
        // 首先尝试从JSON加载，如果失败则使用示例数据
        if let loadedIdioms = loadFromJSON("idioms") {
            idioms = loadedIdioms
        }
    }
    
    // 从JSON文件加载成语数据
    private func loadFromJSON(_ filename: String) -> [Idiom]? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("无法找到 \(filename).json 文件")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode([Idiom].self, from: data)
        } catch {
            print("解析JSON失败: \(error)")
            return nil
        }
    }
}