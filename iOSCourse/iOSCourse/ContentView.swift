//
//  ContentView.swift
//  iOSCourse
//
//  Created by Sivenkov maxim  on 01.10.2023.
//

import SwiftUI

struct ContentView: View {
    private var duration = 0.5
    @State private var isAnimated = false

    var body: some View {
        Button {
            withAnimation((.spring(dampingFraction: 0.5, blendDuration: duration))) {
                isAnimated.toggle()

                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    isAnimated.toggle()
                }
            }
        } label: {
            HStack(spacing: 0) {
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(
                        width: isAnimated ? 40 : 0,
                        height: isAnimated ? 40 : 0
                    )
                    .opacity(isAnimated ? 1 : .zero)
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(
                        width: 40,
                        height: 40
                    )

                Image(systemName: "play.fill")
                    .resizable()
                    .frame(
                        width: isAnimated ? .zero : 40,
                        height: isAnimated ? .zero : 40
                    )
                    .opacity(isAnimated ? 0 : 1)
            }
        }
        .frame(width: 80, height: 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
