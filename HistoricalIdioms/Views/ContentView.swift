import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = IdiomsViewModel()
    @State private var offset: CGFloat = 0
    @State private var isDragging = false
    @State private var cardScale: CGFloat = 1.0
    @State private var cardOpacity: Double = 1.0
    @State private var cardRotation: Double = 0
    @State private var showNextCard: Bool = false
    
    // 卡片宽度和拖动阈值
    private let cardWidth: CGFloat = UIScreen.main.bounds.width - 40
    private let dragThreshold: CGFloat = 80 // 降低阈值使滑动更灵敏
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack {
                Text("历史成语")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("左右滑动切换成语")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom)
                
                ZStack {
                    // 当前卡片
                    ForEach(viewModel.idioms.indices, id: \.self) { index in
                        if index == viewModel.currentIndex {
                            IdiomCardView(idiom: viewModel.idioms[index])
                                .offset(x: offset)
                                .scaleEffect(cardScale)
                                .opacity(cardOpacity)
                                .rotation3DEffect(
                                    .degrees(cardRotation),
                                    axis: (x: 0, y: 1, z: 0),
                                    anchor: offset > 0 ? .leading : .trailing
                                )
                                .zIndex(1)
                                .gesture(
                                    DragGesture()
                                        .onChanged { gesture in
                                            isDragging = true
                                            offset = gesture.translation.width
                                            
                                            // 根据拖动距离计算动画参数
                                            let dragPercentage = min(abs(offset / dragThreshold), 1.0)
                                            cardScale = 1.0 - (dragPercentage * 0.1)
                                            cardOpacity = 1.0 - (dragPercentage * 0.3)
                                            cardRotation = Double(offset / 10)
                                            
                                            // 显示下一张卡片的预览
                                            showNextCard = abs(offset) > dragThreshold / 2
                                        }
                                        .onEnded { gesture in
                                            isDragging = false
                                            let swipeDirection = gesture.translation.width > 0 ? -1 : 1
                                            let swipeVelocity = gesture.predictedEndTranslation.width - gesture.translation.width
                                            let isSwipeIntended = abs(gesture.translation.width) > self.dragThreshold || abs(swipeVelocity) > 100
                                            
                                            if isSwipeIntended {
                                                // 完成滑动动画
                                                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                                    offset = CGFloat(swipeDirection) * cardWidth * 1.5
                                                    cardScale = 0.8
                                                    cardOpacity = 0
                                                    cardRotation = Double(swipeDirection) * -30
                                                }
                                                
                                                // 延迟切换到下一张卡片
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                    if swipeDirection > 0 {
                                                        viewModel.nextIdiom()
                                                    } else {
                                                        viewModel.previousIdiom()
                                                    }
                                                    
                                                    // 重置卡片状态并从另一侧进入
                                                    offset = CGFloat(-swipeDirection) * cardWidth
                                                    cardScale = 0.9
                                                    cardOpacity = 0.5
                                                    cardRotation = Double(-swipeDirection) * 30
                                                    
                                                    // 使用弹性动画恢复卡片
                                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                                                        offset = 0
                                                        cardScale = 1.0
                                                        cardOpacity = 1.0
                                                        cardRotation = 0
                                                    }
                                                }
                                            } else {
                                                // 取消滑动，恢复卡片
                                                withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                                                    offset = 0
                                                    cardScale = 1.0
                                                    cardOpacity = 1.0
                                                    cardRotation = 0
                                                    showNextCard = false
                                                }
                                            }
                                        }
                                )
                        }
                        
                        // 预览下一张卡片（左右两侧）
                        if showNextCard {
                            // 右侧预览（当向左滑动时）
                            if offset < 0 && index == (viewModel.currentIndex + 1) % viewModel.idioms.count {
                                IdiomCardView(idiom: viewModel.idioms[index])
                                    .scaleEffect(0.9)
                                    .opacity(0.5)
                                    .offset(x: cardWidth + offset/3)
                                    .rotation3DEffect(
                                        .degrees(-30),
                                        axis: (x: 0, y: 1, z: 0),
                                        anchor: .leading
                                    )
                                    .zIndex(0)
                            }
                            
                            // 左侧预览（当向右滑动时）
                            if offset > 0 && index == (viewModel.currentIndex - 1 + viewModel.idioms.count) % viewModel.idioms.count {
                                IdiomCardView(idiom: viewModel.idioms[index])
                                    .scaleEffect(0.9)
                                    .opacity(0.5)
                                    .offset(x: -cardWidth + offset/3)
                                    .rotation3DEffect(
                                        .degrees(30),
                                        axis: (x: 0, y: 1, z: 0),
                                        anchor: .trailing
                                    )
                                    .zIndex(0)
                            }
                        }
                    }
                }
                .frame(height: 500)
                
                // 移除了底部的左右箭头指示
                
                Spacer()
            }
        }
        .onAppear {
            viewModel.loadIdioms()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}