//
//  JESABrokerTests.m
//  Wallet
//
//  Created by Jose Enrique Sanchez Alfonso on 3/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "JESAMoney.h"
#import "JESABroker.h"

@interface JESABrokerTests : XCTestCase

@end

@implementation JESABrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testSimpleReduction{
    
    JESABroker *broker = [[JESABroker alloc] init];
    
    JESAMoney *sum = [[JESAMoney dollarWithAmount:5] plus:[JESAMoney dollarWithAmount:5]];
    
    JESAMoney *reduced = [broker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

@end
