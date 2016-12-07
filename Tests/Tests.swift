import XCTest

class Tests: XCTestCase {
    func testTagine() {
        let strings = ["tag1","tag2","tag3","tag4","tag5","tag6"]
        let tagView = TagineTagViewController()
        tagView.tags = strings

    }
}
