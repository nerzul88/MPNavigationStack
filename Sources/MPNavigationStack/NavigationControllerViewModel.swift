import Foundation
import SwiftUI

class NavigationControllerViewModel: ObservableObject {
    private let easing: Animation

    var navigationType: NavigationType = .push

    @Published var currentScreen: Screen?

    var screensStack = ScreensStack() {
        didSet {
            currentScreen = screensStack.top()
        }
    }

    init(easing: Animation) {
        self.easing = easing
    }

    func push<S: View>(newView: S) {
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, screenView: AnyView(newView))
            screensStack.push(newScreen: screen)
        }
    }

    func pop(destination: PopDestination = .prev) {
        withAnimation(easing) {
            switch destination {
            case .prev:
                navigationType = .pop
                screensStack.popPrev()
            case .root:
                navigationType = .pop
                screensStack.popToRoot()
            }
        }
    }
}
