import SwiftUI

struct IdiomDetailView: View {
    let idiom: Idiom
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    .padding([.top, .trailing])
                }
                
                Text(idiom.name)
                    .font(.system(size: 36, weight: .bold))
                    .padding(.horizontal)
                
                Text(idiom.pinyin)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("成语解释")
                        .font(.headline)
                    
                    Text(idiom.explanation)
                        .font(.body)
                    
                    Text("成语故事")
                        .font(.headline)
                        .padding(.top, 8)
                    
                    Text(idiom.story)
                        .font(.body)
                        .lineSpacing(6)
                    
                    Text("出处")
                        .font(.headline)
                        .padding(.top, 8)
                    
                    Text(idiom.source)
                        .font(.body)
                    
                    Text("示例")
                        .font(.headline)
                        .padding(.top, 8)
                    
                    Text(idiom.example)
                        .font(.body)
                        .italic()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(UIColor.secondarySystemBackground))
                )
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.bottom, 30)
        }
    }
}

struct IdiomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IdiomDetailView(idiom: Idiom.examples[0])
    }
}