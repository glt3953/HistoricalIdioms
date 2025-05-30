# HistoricalIdioms
历史成语卡片
## 提示语
用 swiftUI 实现一个历史成语的iOS应用，每个成语故事有详细的文字描述，以左滑切换卡片的交互形式，最低版本支持iOS 15
## 文件结构
HistoricalIdioms/
├── HistoricalIdiomsApp.swift     // 应用入口
├── Models/
│   └── Idiom.swift               // 成语数据模型
├── Views/
│   ├── ContentView.swift         // 主内容视图
│   ├── IdiomCardView.swift       // 成语卡片视图
│   └── IdiomDetailView.swift     // 成语详情视图
├── ViewModels/
│   └── IdiomsViewModel.swift     // 成语视图模型
└── Resources/
    └── idioms.json               // 成语数据 
## 功能特点
1. 左滑交互 ：用户可以通过左右滑动卡片切换不同的成语
2. 详细故事 ：每个成语都有详细的故事描述、解释、出处和例句
3. 现代界面 ：使用 SwiftUI 实现的现代化界面，支持深色模式
4. 动画效果 ：卡片切换时有流畅的动画效果
5. iOS 15 支持 ：应用支持 iOS 15 及以上版本
## 扩展建议
1. 数据持久化 ：将成语数据存储在 JSON 文件中，并通过 FileManager 加载
2. 搜索功能 ：添加搜索功能，方便用户查找特定成语
3. 收藏功能 ：允许用户收藏喜欢的成语
4. 分享功能 ：添加分享按钮，方便用户分享成语故事
5. 语音朗读 ：集成 AVSpeechSynthesizer 实现成语朗读功能
这个应用程序提供了一个良好的基础，您可以根据需要进一步扩展功能。
