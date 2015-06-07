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

// $1 + €1 = 2 currencies
-(void) testNumberOfCurrencies{
    
    JESAWallet *wallet = [[JESAWallet alloc] initWithAmount:1 currency:@"USD"];
    [wallet plus:[JESAMoney euroWithAmount:1]];
    
    
    NSUInteger numberOfCurrencies = wallet.numberOfCurrencies;
    
    XCTAssertEqual(numberOfCurrencies, 2, @"$1 + €1 = 2 currencies");
}

// $1 + €1 + €5 = 2 moneys euro
-(void) testNumberOfEuros{
    
    JESAWallet *wallet = [[JESAWallet alloc] initWithAmount:1 currency:@"USD"];
    [wallet plus:[JESAMoney euroWithAmount:1]];
    [wallet plus:[JESAMoney euroWithAmount:5]];
    
    NSUInteger numberEuros = wallet.countEuros;
    
    XCTAssertEqual(numberEuros, 2, @"$1 + €1 + €5 = 2 moneys euro");
}

// $1 + €1 + $5 = 2 moneys dollar
-(void) testNumberOfDollars{
    
    JESAWallet *wallet = [[JESAWallet alloc] initWithAmount:1 currency:@"USD"];
    [wallet plus:[JESAMoney euroWithAmount:1]];
    [wallet plus:[JESAMoney dollarWithAmount:5]];
    
    NSUInteger numberdollars = wallet.countDollars;
    
    XCTAssertEqual(numberdollars, 2, @"$1 + €1 + $5 = 2 moneys dollar");
}

-(void) testTakeMoney{
    
    JESAWallet *wallet = [[JESAWallet alloc] initWithAmount:5 currency:@"USD"];
    [wallet plus:[JESAMoney euroWithAmount:4]];
    [wallet plus:[JESAMoney dollarWithAmount:3]];
    
    [wallet takeMoney:[JESAMoney dollarWithAmount:3]];
    
    XCTAssertEqual([wallet count], 2, @"");
}

@end
