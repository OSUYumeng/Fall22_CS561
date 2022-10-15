import XCTest
import MyLibrary
@testable import MyLibrary

final class MyLibraryTests: XCTestCase {    
    func testPath() throws{
        let pathString = Bundle.module.path(forResource: "data", ofType: "json")
        XCTAssertNotNil(pathString)
    }

    func testWeatherDataModel() throws {
        
        if let pathString = Bundle.module.url(forResource: "data", withExtension: ".json"){
            var realTest: Weather!
            let data = try! Data(contentsOf: pathString)
            realTest = try! JSONDecoder().decode(Weather.self, from: data)
            XCTAssertEqual(realTest.main.temp, 288.81)
        }
    }
}
