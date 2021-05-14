import SwiftUI
import PlaygroundSupport

struct ContentView: View {
  var body: some View {
    // Implement stair-case effect with alignment guide.
    // You can scale or translate the return value.
    VStack {
      HStack {
        Image(systemName: "swift")
          .resizable()
          .scaledToFit()
          .frame(width: 60)
          .alignmentGuide(VerticalAlignment.center) { $0[.bottom] * 2 }
        Image(systemName: "swift")
          .resizable()
          .scaledToFit()
          .frame(width: 60)
        Image(systemName: "swift")
          .resizable()
          .scaledToFit()
          .frame(width: 60)
          .alignmentGuide(VerticalAlignment.center) { $0[.top] - 60 }
      }
    }
  }
}

PlaygroundPage.current.setLiveView(ContentView())
