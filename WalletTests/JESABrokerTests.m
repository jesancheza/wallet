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
@property (nonatomic, strong) JESABroker *emptyBroker;
@property (nonatomic, strong) JESAMoney *oneDollar;
@end

@implementation JESABrokerTests

- (void)setUp {
    [super setUp];
    
    self.emptyBroker = [JESABroker new];
    self.oneDollar = [JESAMoney dollarWithAmount:1];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

-(void) testSimpleReduction{
    
    JESAMoney *sum = [[JESAMoney dollarWithAmount:5] plus:[JESAMoney dollarWithAmount:5]];
    
    JESAMoney *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

-(void) testReduction{
    
    [self.emptyBroker addRate: 2 fromCurrency:@"EUR" toCurrency: @"USD"];
    
    
    JESAMoney *dollar = [JESAMoney dollarWithAmount:10];
    JESAMoney *euro = [JESAMoney euroWithAmount:5];
    
    JESAMoney *converted = [self.emptyBroker reduce:dollar toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euro,@"$10 != €5 * 2");
}

-(void) testThatNoRateRaisesException{
    
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
}

-(void) testThatNilConversionDoesNoteChangeMoney{
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker
                                           reduce:self.oneDollar
                                           toCurrency:@"USD"],
                          @"A nil conversion should have no effect");
}

@end
