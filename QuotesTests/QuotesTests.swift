//
//  StoryBoardableTests.swift
//  StoryBoardableTests
//
//  Created by Dennis Vera on 5/22/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import XCTest
@testable import Quotes

class StoryBoardableTests: XCTestCase {
    
    func testQuotesViewController() {
        _ = QuotesViewController.instantiate()
    }
    
    func testSettingsViewController() {
        _ = SettingsViewController.instantiate()
    }
}
