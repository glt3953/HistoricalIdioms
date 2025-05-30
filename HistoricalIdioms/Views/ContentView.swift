import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = IdiomsViewModel()
    @State private var offset: CGFloat = 0
    @State private var isDragging = false
    
    // 卡片宽度和拖动阈值
    private let cardWidth: CGFloat = UIScreen.main.bounds.width - 40
    private let dragThreshold: CGFloat = 120
    
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
                    ForEach(viewModel.idioms.indices, id: \.self) { index in
                        if index == viewModel.currentIndex {
                            IdiomCardView(idiom: viewModel.idioms[index])
                                .offset(x: offset)
                                .rotationEffect(.degrees(Double(offset / 20)))
                                .gesture(
                                    DragGesture()
                                        .onChanged { gesture in
                                            isDragging = true
                                            offset = gesture.translation.width
                                        }
                                        .onEnded { gesture in
                                            isDragging = false
                                            withAnimation(.spring()) {
                                                if offset > dragThreshold {
                                                    viewModel.previousIdiom()
                                                } else if offset < -dragThreshold {
                                                    viewModel.nextIdiom()
                                                }
                                                offset = 0
                                            }
                                        }
                                )
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)
                                ))
                        }
                    }
                }
                .frame(height: 500)
                
                HStack(spacing: 20) {
                    Button(action: {
                        withAnimation(.spring()) {
                            viewModel.previousIdiom()
                        }
                    }) {
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            viewModel.nextIdiom()
                        }
                    }) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                
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