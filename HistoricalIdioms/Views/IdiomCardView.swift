import SwiftUI

struct IdiomCardView: View {
    let idiom: Idiom
    @State private var isShowingDetail = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(idiom.name)
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.primary)
            
            Text(idiom.pinyin)
                .font(.title3)
                .foregroundColor(.secondary)
            
            Divider()
            
            Text(idiom.explanation)
                .font(.body)
                .foregroundColor(.primary)
                .padding(.bottom, 8)
            
            Text("出处：\(idiom.source)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button(action: {
                isShowingDetail = true
            }) {
                Text("查看故事详情")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: Color.black.opacity(0.2), radius: 15, x: 0, y: 5)
        )
        .padding(.horizontal, 20)
        .sheet(isPresented: $isShowingDetail) {
            IdiomDetailView(idiom: idiom)
        }
    }
}

struct IdiomCardView_Previews: PreviewProvider {
    static var previews: some View {
        IdiomCardView(idiom: Idiom.examples[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.light)
        
        IdiomCardView(idiom: Idiom.examples[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
    }
}