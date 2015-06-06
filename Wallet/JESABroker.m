//
//  JESABroker.m
//  Wallet
//
//  Created by Jose Enrique Sanchez Alfonso on 3/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESABroker.h"
#import "JESAMoney.h"

@interface JESABroker ()
@property (nonatomic, strong) NSMutableDictionary *rates;
@end

@implementation JESABroker

-(id)init{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    
    return self;
}

-(JESAMoney *) reduce:(JESAMoney *) money
           toCurrency:(NSString *) currency{
    
    return money;
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency{
 
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    
    
}

#pragma mark - Utils
-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

@end
