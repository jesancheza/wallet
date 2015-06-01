//
//  JESAMoneyTests.m
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "JESAMoney.h"

@interface JESAMoneyTests : XCTestCase

@end

@implementation JESAMoneyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatInitRaisesException{
    
    XCTAssertThrows([[JESAMoney alloc] initWithAmount:3]);
}

@end
