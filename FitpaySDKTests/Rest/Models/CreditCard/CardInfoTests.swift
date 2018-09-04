import XCTest
import Nimble

@testable import FitpaySDK

class CardInfoTests: XCTestCase {
    let mockModels = MockModels()
    
    func testCardInfoParsing() {
        let cardInfo = mockModels.getCreditCardInfo()
        
        expect(cardInfo?.address).toNot(beNil())
        expect(cardInfo?.riskData).toNot(beNil())
        expect(cardInfo?.pan).to(equal("pan"))
        expect(cardInfo?.expMonth).to(equal(2))
        expect(cardInfo?.expYear).to(equal(2018))
        expect(cardInfo?.cvv).to(equal("cvv"))
        expect(cardInfo?.name).to(equal("someName"))
        
        let json = cardInfo?.toJSON()
        expect(json?["address"]).toNot(beNil())
        expect(json?["riskData"]).toNot(beNil())
        expect(json?["pan"] as? String).to(equal("pan"))
        expect(json?["expMonth"] as? Int).to(equal(2))
        expect(json?["expYear"] as? Int).to(equal(2018))
        expect(json?["cvv"] as? String).to(equal("cvv"))
        expect(json?["name"] as? String).to(equal("someName"))
    }
    
    func testCardInfoParsingWithNilValues() {
        let cardInfo = mockModels.getCreditCardInfoWithNilValues()
        
        expect(cardInfo?.address).to(beNil() )
        expect(cardInfo?.riskData).to(beNil())
        expect(cardInfo?.pan).to(equal("pan"))
        expect(cardInfo?.expMonth).to(beNil())
        expect(cardInfo?.expYear).to(beNil())
        expect(cardInfo?.cvv).to(beNil())
        expect(cardInfo?.name).to(equal("someName"))
        
        let json = cardInfo?.toJSON()
        expect(json?["address"]).to(beNil())
        expect(json?["riskData"]).to(beNil())
        expect(json?["pan"] as? String).to(equal("pan"))
        expect(json?["expMonth"] as? Int).to(beNil())
        expect(json?["expYear"]).to(beNil())
        expect(json?["cvv"]).to(beNil())
        expect(json?["name"] as? String).to(equal("someName"))
    }
}