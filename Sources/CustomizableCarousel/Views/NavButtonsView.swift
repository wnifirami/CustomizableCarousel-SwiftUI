import SwiftUI

struct NavButtonsView: View {
    var viewModel: CarouselViewModel
    let count: Int
    let configuration: CarouselConfiguration

    var body: some View {
        HStack(spacing: 12) {
            NavButtonView(
                icon: "chevron.left",
                isDisabled: !configuration.behavior.loopsInfinitely && viewModel.currentIndex == 0
            ) {
                viewModel.retreat(count: count, loopsInfinitely: configuration.behavior.loopsInfinitely)
            }
            .equatable()

            NavButtonView(
                icon: "chevron.right",
                isDisabled: !configuration.behavior.loopsInfinitely && viewModel.currentIndex == count - 1
            ) {
                viewModel.advance(count: count, loopsInfinitely: configuration.behavior.loopsInfinitely)
            }
            .equatable()
        }
    }
}
