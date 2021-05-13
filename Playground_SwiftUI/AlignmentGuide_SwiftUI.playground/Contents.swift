import SwiftUI
import PlaygroundSupport

struct ContentView: View {
  var body: some View {
    // Implement stair-case effect with alignment guide.
    VStack {
      HStack {
        Image(systemName: "swift")
          .resizable()
          .scaledToFit()
          .frame(width: 60)
          .alignmentGuide(VerticalAlignment.center) { $0[.bottom]}
        Image(systemName: "swift")
          .resizable()
          .scaledToFit()
          .frame(width: 60)
        Image(systemName: "swift")
          .resizable()
          .scaledToFit()
          .frame(width: 60)
          .alignmentGuide(VerticalAlignment.center) { $0[.top]}
      }
    }
  }
}

PlaygroundPage.current.setLiveView(ContentView())
