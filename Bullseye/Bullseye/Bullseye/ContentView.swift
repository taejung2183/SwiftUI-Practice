//
//  ContentView.swift
//  Bullseye
//
//  Created by atj on 2021/01/09.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    //@State로 선언된 변수는 초기값을 가지고 프로그램 실행 시 특정 행동을 통해 조작된다.
    //@State로 선언한 변수는 변경시 마다 body에서도 같아진다.
    //SwiftUI에서는 상태와 UI가 항상 동일하도록 작성된다.
    @State var isAlertVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    @State var totalScore: Int = 0
    @State var round: Int = 1
    // You can define your own color if you know the exact RGB values.
    let midnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)
    
    // ViewModifier: It's an object whose job is to receive a view, style it up and return.
    // ViewModifier is an example of a protocol.
    
    // MARK: ViewModifiers
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .foregroundColor(Color.white)
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
                .foregroundColor(Color.yellow)
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .foregroundColor(Color.black)
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
                .foregroundColor(Color.black)
        }
    }
    
    var body: some View {
        VStack {
            Spacer()

            // MARK: Target row
            HStack {
                Text("Put the bulleyes as close as you can to:")
                    .modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
            }
            Spacer()

            // MARK: Slider row
            HStack {
                Text("1").modifier(LabelStyle())
                // Whenever the sliderValue changes it'll automatically update the sliderValue variable in our class.
                // Its range that changes is 1 to 100.
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
            Spacer()

            // MARK: "Hit me!" button
            Button(action: {
                //print("Hit me button pressed")
                self.isAlertVisible = true
            }) {
                Text("Hit Me!").modifier(ButtonLargeTextStyle())
            }
            // "() -> Alert in" : Function that receive no argument and returns Alert.
            //Use '$' before "@State declared" variable so that can keep track of the change.
            .alert(isPresented: $isAlertVisible) { () -> Alert in
                return Alert(title: Text(alertTitle()), message: Text(
                    "The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRound()) points this round."
                ), dismissButton: .default(Text("Complimenti!")) {
                    // You can code certain actions after dismissButton pressed like this.
                    totalScore += pointsForCurrentRound()
                    target = Int.random(in: 1...100)
                    round += 1
                })
            }
            .background(Image("Button")).modifier(Shadow())
            Spacer()

            HStack {
                Button(action: {
                    resetGame()
                }) {
                    // MARK: "Start over" button
                    HStack{
                        Image("StartOverIcon")
                        Text("Start over").modifier(ButtonSmallTextStyle())
                    }
                }
                .background(Image("Button")).modifier(Shadow())
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(totalScore)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                    // MARK: "Info" button
                    HStack {
                        Image("InfoIcon")
                        Text("info").modifier(ButtonSmallTextStyle())
                    }
                }
                .background(Image("Button")).modifier(Shadow())
            }
            .padding(.bottom, 20)
        }
        // The largest view that body returns is a VStack.
        .background(Image("Background"), alignment: .center)
        // accent color is light blue by default.
        .accentColor(midnightBlue)
        .navigationBarTitle("Bullseye")
    }
    
    // MARK: Functions
    
    func sliderValueRounded() -> Int {
        // If there's only one line in a function that returns value,
        // you don't need to write 'return' keyword.
        return Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        print("target: \(target)")
        print("sliderValue: \(sliderValue)")
        return abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let diff = amountOff()
        // If you put maximumScore rather than just constant 100,
        // you'll easily notice that 100 is equal to maximum score in this game.
        var point = maximumScore - amountOff()
        
        if diff == 0 {
            point += 100
        } else if diff == 1 {
            point += 50
        } else {}
        
        return point
    }
    
    func alertTitle() -> String {
        let diff = amountOff()
        let title: String
        
        // If you set 'let' variable in the if-else statement,
        // Swift automatically knows it'll set only once.
        // (That's why setting 'let' variable after declaration is possible here.)
        if diff == 0 {
            title = "perfect!"
        } else if diff < 5 {
            title = "You almost had it!"
        } else if diff <= 10 {
            title = "Not bad"
        } else {
            title = "Are you even trying?"
        }
        
        return title
    }
    
    func resetGame() {
        // It is better to define certain process in a method
        // rather than in a button's action method.
        totalScore = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
}

//Write the code as you want to preview.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        //Fix the preview to the Landscape mode. (Give a proper size that fits to your current previewing iPhone.)
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
