import Foundation

struct ScreensStack {

    var screens: [Screen] = []

    func top() -> Screen? {
        screens.last
    }

    mutating func push(newScreen: Screen) {
        screens.append(newScreen)
    }

    mutating func popPrev() {
        _ = screens.popLast()
    }

    mutating func popToRoot() {
        screens.removeAll()
    }
}
