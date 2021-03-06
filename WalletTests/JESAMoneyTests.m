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

-(void) testThatInitDoesNotRaisesException{
    
    XCTAssertNoThrow([JESAMoney dollarWithAmount:3]);
    XCTAssertNoThrow([JESAMoney euroWithAmount:3]);
}

-(void) testCurrency{
    
    JESAMoney *dollars = [JESAMoney dollarWithAmount:1];
    
    XCTAssertEqualObjects(@"USD", [dollars currency]);
    
    JESAMoney *euros = [JESAMoney euroWithAmount:1];
    
    XCTAssertEqualObjects(@"EUR", [euros currency]);
}

- (void)testMultiplication {
    
    JESAMoney *five = [JESAMoney euroWithAmount:5];
    JESAMoney *product = [five times: 2];
    XCTAssertEqualObjects(product, [JESAMoney euroWithAmount:10]);
    
    JESAMoney *fiveUSD = [JESAMoney dollarWithAmount:5];
    JESAMoney *productUSD = [fiveUSD times:2];
    
    XCTAssertEqualObjects(productUSD, [JESAMoney dollarWithAmount:10]);
}

-(void) testEquality{
    JESAMoney *five = [JESAMoney euroWithAmount:5];
    JESAMoney *otherFive = [JESAMoney euroWithAmount:5];
    
    XCTAssertEqualObjects(five, otherFive);
    
    JESAMoney *seven = [JESAMoney euroWithAmount:7];
    
    XCTAssertNotEqual(seven, five);
}

-(void) testDifferentCurrenies{
    
    JESAMoney *euro = [JESAMoney euroWithAmount:1];
    JESAMoney *dollar = [JESAMoney dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different currecies should not be equal!");
}

-(void) testHash{
    JESAMoney *a = [JESAMoney euroWithAmount:2];
    JESAMoney *b = [JESAMoney euroWithAmount:2];
    
    JESAMoney *c = [JESAMoney dollarWithAmount:2];
    JESAMoney *d = [JESAMoney dollarWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    XCTAssertEqual([c hash], [d hash], @"Equal objects must have same hash");
}

-(void) testAmountStorage{
    
    JESAMoney *euro = [JESAMoney euroWithAmount:2];
    JESAMoney *dollar = [JESAMoney dollarWithAmount:4];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue],@"The value retrieved should be the same as the store");
    
    XCTAssertEqual(4, [[dollar performSelector:@selector(amount)]integerValue],@"The value retrieved should be the same as the store");
    
#pragma clang diagnostic pop
}

-(void) testSimpleAddition{
    XCTAssertEqualObjects([[JESAMoney dollarWithAmount:5] plus:
                              [JESAMoney dollarWithAmount:5]],
                             [JESAMoney dollarWithAmount:10],
                             @"$5 + 5$ = 10$");
}

-(void) testThatHashIsAmount{
    
    JESAMoney *one = [JESAMoney dollarWithAmount:1];
    
    XCTAssertEqual([one hash], 1,@"The hash must be the same as the amount");
}

-(void) testDescription{
    
    JESAMoney *one = [JESAMoney dollarWithAmount:1];
    
    NSString *desc = @"<JESAMoney: USD 1>";
    
    XCTAssertEqualObjects(desc, [one description],@"Description must match template ");
}

@end
