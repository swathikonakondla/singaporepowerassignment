//
//  PSIResponseTests.swift
//  GetMeThePSITests
//
//  Created by Swathi on 16/11/19.
//

import XCTest
@testable import GetMeThePSI

class PSIResponseTests: XCTestCase {
    
    let samplePSIResponse = "{\"region_metadata\":[{\"name\":\"west\",\"label_location\":{\"latitude\":1.35735,\"longitude\":103.7}},{\"name\":\"national\",\"label_location\":{\"latitude\":0,\"longitude\":0}},{\"name\":\"east\",\"label_location\":{\"latitude\":1.35735,\"longitude\":103.94}},{\"name\":\"central\",\"label_location\":{\"latitude\":1.35735,\"longitude\":103.82}},{\"name\":\"south\",\"label_location\":{\"latitude\":1.29587,\"longitude\":103.82}},{\"name\":\"north\",\"label_location\":{\"latitude\":1.41803,\"longitude\":103.82}}],\"items\":[{\"timestamp\":\"2019-11-19T10:00:00+08:00\",\"update_timestamp\":\"2019-11-19T10:08:53+08:00\",\"readings\":{\"o3_sub_index\":{\"west\":3,\"national\":5,\"east\":4,\"central\":5,\"south\":3,\"north\":1},\"pm10_twenty_four_hourly\":{\"west\":33,\"national\":35,\"east\":35,\"central\":24,\"south\":35,\"north\":28},\"pm10_sub_index\":{\"west\":33,\"national\":35,\"east\":35,\"central\":24,\"south\":35,\"north\":28},\"co_sub_index\":{\"west\":8,\"national\":10,\"east\":10,\"central\":5,\"south\":6,\"north\":7},\"pm25_twenty_four_hourly\":{\"west\":15,\"national\":17,\"east\":17,\"central\":14,\"south\":15,\"north\":14},\"so2_sub_index\":{\"west\":6,\"national\":6,\"east\":2,\"central\":1,\"south\":4,\"north\":3},\"co_eight_hour_max\":{\"west\":0.76,\"national\":1.03,\"east\":1.03,\"central\":0.46,\"south\":0.64,\"north\":0.68},\"no2_one_hour_max\":{\"west\":21,\"national\":35,\"east\":29,\"central\":26,\"south\":35,\"north\":30},\"so2_twenty_four_hourly\":{\"west\":10,\"national\":10,\"east\":4,\"central\":2,\"south\":6,\"north\":5},\"pm25_sub_index\":{\"west\":54,\"national\":57,\"east\":57,\"central\":54,\"south\":54,\"north\":53},\"psi_twenty_four_hourly\":{\"west\":54,\"national\":57,\"east\":57,\"central\":54,\"south\":54,\"north\":53},\"o3_eight_hour_max\":{\"west\":7,\"national\":11,\"east\":10,\"central\":11,\"south\":8,\"north\":2}}}],\"api_info\":{\"status\":\"healthy\"}}"
    
    var actualPSIResponse : PSIResponse!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_PSIResponse_Decoder_ValidData() {

        let jsonData = samplePSIResponse.data(using: String.Encoding.utf8)
        let decoder = JSONDecoder()
        actualPSIResponse = try! decoder.decode(PSIResponse.self, from: jsonData!)
        
        XCTAssertNotNil(actualPSIResponse)
    }
    
    func test_PSI_Response_o3_eight_hour_max_value_valid() {
        let region = "west"
        let expectedValue = 100
        
        let jsonData = samplePSIResponse.data(using: String.Encoding.utf8)
        let decoder = JSONDecoder()
        actualPSIResponse = try! decoder.decode(PSIResponse.self, from: jsonData!)
                
        if let _ = actualPSIResponse {
            if  let psiItems = actualPSIResponse?.items?.first {
                if let readings = psiItems.readings {
                    if let actual_o3_eight_hour_max_value = readings.o3_eight_hour_max![region] {
                        XCTAssert(expectedValue == actual_o3_eight_hour_max_value)
                    }
                    else {
                        XCTFail("Invalid PSI Response")
                    }
                }
                else {
                    XCTFail("Invalid PSI Response")
                }
            }
            else {
                XCTFail("Invalid PSI Response")
            }
        }
        else {
            XCTFail("Invalid PSI Response")
        }
    }

}
