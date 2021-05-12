/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContentView: View {
  @State private var selectedGenre = Genre.list.first

  var body: some View {
    NavigationView {
      ScrollView {
        ScrollViewReader { proxy in
          let horizontalPadding: CGFloat = 40
          LazyVStack(alignment: .leading) {
            ForEach(Genre.list) { genre in
              Text(genre.name)
                .padding(.leading, horizontalPadding)
                .id(genre)
              
              ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                  ForEach(genre.subgenres, content: \.view)
                }
                .padding(.leading, horizontalPadding)
              }
              Divider()
                .padding(.horizontal, horizontalPadding)
                .padding(.top)
            }
            .onChange(of: selectedGenre) { genre in
              withAnimation {
                proxy.scrollTo(genre, anchor: .top)
              }
              selectedGenre = nil
            }
          }
        }
      }
      .padding(.top)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem {
          Menu("Genre") {
            ForEach(Genre.list) { genre in
              Button(genre.name) {
                selectedGenre = genre
              }
            }
          }
        }
      }
    }
  }
}

private extension Genre.Subgenre {
  var view: some View {
    RoundedRectangle(cornerRadius: 8)
      .fill(
        LinearGradient(
          gradient: .init(
            colors: AnyIterator { } .prefix(2).map {
              .random(saturation: 2 / 3, value: 0.85)
            }
          ),
          startPoint: .topLeading, endPoint: .bottomTrailing
        )
      )
      .frame(width: 125, height: 125)
      .overlay(
        Image("Genre/\(Int.random(in: 1...92))")
          .resizable()
          .saturation(0)
          .blendMode(.multiply)
          .scaledToFit()
      )
      .overlay(
        Text(name)
          .foregroundColor(.white)
          .fontWeight(.bold)
          .padding(10)
          .frame(alignment: .bottomLeading),
        alignment: .bottomLeading
      )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
