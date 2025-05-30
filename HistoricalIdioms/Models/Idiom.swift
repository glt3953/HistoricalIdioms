import Foundation

struct Idiom: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String           // 成语名称
    let pinyin: String         // 拼音
    let explanation: String    // 解释
    let story: String          // 故事内容
    let source: String         // 出处
    let example: String        // 例句
    
    static func == (lhs: Idiom, rhs: Idiom) -> Bool {
        lhs.id == rhs.id
    }
    
    // 示例数据
    static let examples = [
        Idiom(name: "刻舟求剑", 
              pinyin: "kè zhōu qiú jiàn", 
              explanation: "比喻不懂事物发展变化的道理，拘泥于死板的做法。", 
              story: "春秋时期，楚国有个人坐船渡江。不小心，他的剑掉进了江里。这个人立刻在船舷上刻了一个记号，心想："我的剑是从这个地方掉下去的，刻个记号，到了岸边就可以找到它了。"船靠岸后，他果然按照船上刻的记号跳入水中去找剑，可是剑早已随着水流漂走了。", 
              source: "《吕氏春秋·察今》", 
              example: "他做事总是刻舟求剑，不懂得灵活变通。"),
        Idiom(name: "画蛇添足", 
              pinyin: "huà shé tiān zú", 
              explanation: "比喻做了多余的事，非但无益，反而不合适。", 
              story: "战国时期的楚国，有个地方举行祭祀活动，主持人拿出一壶酒，对大家说："谁先把蛇画完，这壶酒就赏给谁。"一个人很快画完了蛇，但他见别人还没画完，就得意地说："我还可以给蛇画上脚呢！"结果他正在画蛇脚的时候，另一个人画完了蛇，拿走了酒。", 
              source: "《战国策·齐策》", 
              example: "这篇文章已经很完美了，如果再增加内容反而是画蛇添足。"),
        Idiom(name: "守株待兔", 
              pinyin: "shǒu zhū dài tù", 
              explanation: "比喻希望不经过努力而得到成功的侥幸心理。", 
              story: "宋国有个农夫，在田里耕作时，看见一只兔子撞在树桩上死了。他捡起兔子，心想："我以后只要守在这棵树旁，等着兔子撞死，就不用耕田了。"于是他天天守在树旁，但再也没有兔子撞死，他的田地也荒芜了。", 
              source: "《韩非子·五蠹》", 
              example: "创业不能守株待兔，必须积极主动寻找机会。"),
        Idiom(name: "亡羊补牢", 
              pinyin: "wáng yáng bǔ láo", 
              explanation: "比喻出了问题以后想办法补救，可以防止继续受损失。", 
              story: "从前有个人养了一群羊，但羊圈有很多破洞。一天，一只羊从洞里跑了出去。有人讥笑他说："羊已经跑了，现在才修补羊圈，有什么用呢？"那人回答说："现在补好羊圈，还可以防止其他羊跑掉啊！"", 
              source: "《战国策·楚策》", 
              example: "发现系统漏洞后，公司立即组织技术人员亡羊补牢，避免了更大的损失。"),
        Idiom(name: "愚公移山", 
              pinyin: "yú gōng yí shān", 
              explanation: "比喻坚持不懈地改造自然和坚定不移地进行斗争。", 
              story: "古代有个老人叫愚公，他家门前有两座大山挡住了出行的路。愚公决定带领子孙后代把山挖平。有人笑他不自量力，愚公说："我死了有儿子，儿子死了有孙子，子子孙孙无穷尽，而山不会增高，总有一天会把它挖平。"神被愚公的精神感动，命令夸父的两个儿子把山搬走了。", 
              source: "《列子·汤问》", 
              example: "他带领团队以愚公移山的精神，最终攻克了这个技术难题。")
    ]
}