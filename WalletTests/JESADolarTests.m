//
//  JESADolarTests.m
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "JESADolar.h"

@interface JESADolarTests : XCTestCase

@end

@implementation JESADolarTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testMultiplication{
    
    JESADolar *five = [[JESADolar alloc] initWithAmount:5];
    JESADolar *product = [five times:2];
    
    XCTAssertEqualObjects(product, [[JESADolar alloc] initWithAmount:10]);
}

@end
