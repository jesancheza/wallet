//
//  JESAEuroTests.m
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "JESAEuro.h"

@interface JESAEuroTests : XCTestCase

@end

@implementation JESAEuroTests

- (void)setUp {
    [super setUp];
    // Creo el entorno
}

- (void)tearDown {
    [super tearDown];
    // Me cargo el entorno
}

- (void)testMultiplication {
    
    JESAEuro *five = [[JESAEuro alloc] initWithAmount:5];
    [five times: 2];
    XCTAssertEqual(10, five.amount);
}

@end
