import XCTest
import MyLibrary
@testable import MyLibrary


final class myLibraryIntegrationTests: XCTestCase {
    
    
    func testServer() async throws {
       
        // Given
        // Create a weather service (OOP)
        let myService = WeatherServiceImpl()
            
        // When
        // Got the temperature
        let temp = try await myService.getTemperature()
        
        // Then
        // Check the temperature is what you expect
        
        //66
        XCTAssertEqual(temp, 63)
        
        
    }
    
}