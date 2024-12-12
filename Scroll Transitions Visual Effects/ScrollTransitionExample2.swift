//
//  ScrollTransitionExample2.swift
//  Scroll Transitions Visual Effects
//
//  Created by Tamara Nastevska on 12.12.24.
//

import SwiftUI

struct ScrollTransitionExample2: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(images, id: \.self) { name in
                    ZStack {
                        MyImageView(name: name)
                            .scrollTransition(axis: .horizontal) { content, phase in
                                // -1 ... 1
                                let value =  phase.value
                                
                                // 0 to 1
                                var opacity = (phase.value + 1) / 2
                                
                                opacity = phase.isIdentity ? 1 : opacity
                                
                                let contrast = phase.isIdentity ? 1 : 1.5*(1+phase.value)
                                let brightness = 0.3*abs(phase.value)
                                
                                return content
                                    .offset(x: phase.value*(-500))
                                    .contrast(contrast)
                                    .brightness(brightness)
                            }
                    }
                    .containerRelativeFrame(.horizontal)
                    .clipShape(.rect(cornerRadius: 30))
                }
            }
        }
    }
}

#Preview {
    ScrollTransitionExample2()
}
