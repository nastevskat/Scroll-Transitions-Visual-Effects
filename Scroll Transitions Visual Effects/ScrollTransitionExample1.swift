
import SwiftUI

// Wish list:
// LEFT: opacity = 0
// value = -1
// CENTER: opacity = 1
// value = 0
// RIGHT: opacity = 0
// value = 1
struct ScrollTransitionExample1: View {

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
                                let opacity = 0.5 + 0.5 * cos((.pi/2) * value)

                                return content
                                    .scaleEffect(opacity)
                            }
                    }
                    .containerRelativeFrame(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ScrollTransitionExample1()
}
