//
//  ContentView.swift
//  Assignment1
//
//  Created by 최지현 on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    
    let title = "Memorize!"
    @State var emojis :[String] = ["👻" ,"🎃","🕷️","😈","💀","🕸️","🧙","🙀","👹","😱","☠️","🍭"] + ["👻" ,"🎃","🕷️","😈","💀","🕸️","🧙","🙀","👹","😱","☠️","🍭"]
    
    
    let halloweenEmojis = ["👻" ,"🎃","🕷️","😈","💀","🕸️","🧙","🙀","👹","😱","☠️","🍭"]
    let vehicleEmojis = ["🚗", "🚙", "🚚", "🚛", "🚜", "🏎️", "🚓", "🚑", "🚒", "🚐"]
    let fruitEmojis = ["🍎", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍒", "🍑", "🍍"]
    
    var body: some View {
        VStack{
            Text(title).font(.largeTitle)
            ScrollView{
                cards
            }
            themeSelector
            Spacer()
        }
    
        .padding()
        
    }
    
    var themeSelector : some View {
        HStack {
            Spacer()
            halloweenTheme
            Spacer()
            vehicleTheme
            Spacer()
            fruitTheme
            Spacer()    // 왜 정렬이 안되지?? - font 크기 때문에
            
        }
    }
    
    func choiceCardTheme(emoji : [String], symbol : String) -> some View {
        Button(action: {emojis = emoji + emoji }, label: {Image(systemName: symbol)})
    }
    
    var halloweenTheme : some View {
        VStack { choiceCardTheme(emoji: halloweenEmojis.shuffled(), symbol: "h.square.fill")
                .font(.largeTitle)
                Text("Halloween")
                .font(.caption2)
        }
    }
        
    var vehicleTheme : some View {
        VStack {
            choiceCardTheme(emoji: vehicleEmojis.shuffled(), symbol: "car")
            .font(.largeTitle)
            Text("Vehicle")
                .font(.caption2)
        }
    }
        
    var fruitTheme : some View {
        VStack {
            choiceCardTheme(emoji: fruitEmojis.shuffled(), symbol: "apple.logo")
                .font(.largeTitle)
                Text("fruits")
                .font(.caption2)
        }
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
}

struct CardView: View {
    
    let content : String
    @State var isFacedUp = false
    
    var body: some View{
        ZStack{
                let base = RoundedRectangle(cornerRadius: 12)
                Group{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFacedUp ? 1 : 0)
            base.fill().opacity(isFacedUp ? 0 : 1) // checkpoint 1 왜 fill 매개변수 필요없지?
            }
            .onTapGesture {
                isFacedUp.toggle()
            }
        }
    }

    
#Preview {
    ContentView()
}
