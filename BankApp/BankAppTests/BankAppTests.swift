//
//  BankAppTests.swift
//  BankAppTests
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import XCTest
import CoreData
@testable import BankApp

class BankAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        XCTAssert(1 + 1 == 2)
    }
    
    func testRateConnection()
    {
        do
        {
            let jsonData = try Data(contentsOf: URL(string: "https://belarusbank.by/api/kursExchange")!)
            
            XCTAssertNoThrow( try JSONSerialization.jsonObject(
            with: jsonData, options: .mutableContainers) as! [[String : AnyObject]])
        }
        catch
        {
            XCTAssertTrue(false)
        }
    }
    
    func testCoordinatesConnection()
    {
        do
        {
            let jsonData = try Data(contentsOf: URL(string: "https://belarusbank.by/api/filials_info")!)
            
            XCTAssertNoThrow( try JSONSerialization.jsonObject(
            with: jsonData, options: .mutableContainers) as! [[String : AnyObject]])
        }
        catch
        {
            XCTAssertTrue(false)
        }
    }
    
    func testLoginAndPassword()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var findedd  = false
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            for data in results as! [NSManagedObject] {
                
                if data.value(forKey: "login") as? String == "example"
                {
                    if data.value(forKey: "password") as? String == "123" {
                        findedd = true
                    }
                }
            }
        }
        catch let error as NSError {
            print("Data loading error: \(error)")
        }
        
        XCTAssertTrue(findedd)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
