//
//  JESAWalletTests.m
//  Wallet
//
//  Created by Jose Enrique Sanchez Alfonso on 7/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "JESAMoney.h"
#import "JESABroker.h"
#import "JESAWallet.h"

@interface JESAWalletTests : XCTestCase

@end

@implementation JESAWalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100 2:1
-(void) testAdditionWithReduction{
    
    JESABroker *broker = [JESABroker new];
    [broker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    JESAWallet *wallet = [[JESAWallet alloc] initWithAmount:40 currency:@"EUR"];
    
    [wallet plus: [JESAMoney dollarWithAmount:20]];
    
    JESAMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [JESAMoney dollarWithAmount:100],@"€40 + $20 = $100 2:1");
}

@end
