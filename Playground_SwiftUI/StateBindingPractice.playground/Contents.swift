import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var swiftyColor: Color = .red
    @State private var swiftyOpacity: Double = 0.7
    
    var body: some View {
        VStack {
            SwiftyControl(swiftyColor: $swiftyColor, swiftyOpacity: $swiftyOpacity)

            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .padding(25)
                .foregroundColor(.white)
                .opacity(swiftyOpacity)
                .opacity(0.7)
                .background(swiftyColor) // Pass the color you picked.
                .cornerRadius(50)
        }
        .padding()
    }
}

struct SwiftyControl: View {
    @Binding var swiftyColor: Color
    @Binding var swiftyOpacity: Double
    
    var body: some View {
        // We need to store our selection of this color picker
        // and pass it onto image.
        ColorPicker("Swifty Color", selection: $swiftyColor)
        Slider(value: $swiftyOpacity, in: 0...1)
            .accentColor(swiftyColor)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
