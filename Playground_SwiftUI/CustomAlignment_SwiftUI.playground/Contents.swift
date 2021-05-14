import SwiftUI
import PlaygroundSupport

struct ContentView: View {
  var body: some View {
    HStack(alignment: .midAccountAndName) {
    // Align these two views so their centers are both on the .midAccountAndName guide”
      VStack {
        Text("@atj")
          .alignmentGuide(.midAccountAndName) { $0[VerticalAlignment.center] }
        Image(systemName: "swift")
          .resizable()
          .frame(width: 64, height: 64)
      }
      
      VStack {
        Text("Full name:")
        Text("AHN TAE JEONG")
          .font(.largeTitle)
          .alignmentGuide(.midAccountAndName) { $0[VerticalAlignment.center] }
      }
    }
  }
}

extension VerticalAlignment {
  enum MidAccountAndName: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
      context[.top]
    }
  }
  static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

PlaygroundPage.current.setLiveView(ContentView())
