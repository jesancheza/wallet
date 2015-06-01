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
    JESAEuro *product = [five times: 2];
    XCTAssertEqualObjects(product, [[JESAEuro alloc] initWithAmount:10]);
}

-(void) testEquality{
    JESAEuro *five = [[JESAEuro alloc] initWithAmount:5];
    JESAEuro *otherFive = [[JESAEuro alloc] initWithAmount:5];
    
    XCTAssertEqualObjects(five, otherFive);
    
    JESAEuro *seven = [[JESAEuro alloc] initWithAmount:7];
    
    XCTAssertNotEqual(seven, five);
}

@end
