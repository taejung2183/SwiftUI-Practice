//
//  ContentView.swift
//  Memorize
//
//  Created by atj on 2021/06/16.
//

import SwiftUI

struct ContentView: View {
  var emojis = ["🏎", "🚜", "🚀", "🚆", "🚁", "🚕", "🚛", "✈️", "🛵", "🚗"]
  @State var emojiCnt = 10;

  var body: some View {
    VStack {
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
          ForEach(emojis[0 ..< emojiCnt], id: \.self) { emoji in
            CardView(content: emoji)
              .aspectRatio(2 / 3, contentMode: .fit)
          }
        }
        .foregroundColor(.red)
      }
      Spacer()
      HStack {
        remove
        Spacer()
        add
      }
      .padding()
    }
    .padding()
  }
  
  var remove: some View {
    Button {
      if emojiCnt > 1 { emojiCnt -= 1 }
    } label: {
      Image(systemName: "minus.circle")
        .font(.largeTitle)
    }
  }
  
  var add: some View {
    Button {
      if emojiCnt < emojis.count { emojiCnt += 1 }
    } label: {
      Image(systemName: "plus.circle")
        .font(.largeTitle)
    }
  }
}



struct CardView: View {
  @State var isFaceUp = true
  var content: String
  // We don't want the imoji to be duplicated
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 15.0)
      if isFaceUp {
        shape.fill().foregroundColor(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(content).font(.largeTitle)
      }
      else {
        shape.fill()
      }
    }
    .onTapGesture {
      isFaceUp = !isFaceUp
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 763, height: 390))
    ContentView()
      .preferredColorScheme(.dark)
    ContentView()
  }
}


