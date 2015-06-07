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

@end

@implementation JESABroker

-(id)init{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    
    return self;
}

-(id<JESAMoney>) reduce:(id<JESAMoney>) money
           toCurrency:(NSString *) currency{
    
    // double dispatch
    return [money reduceToCurrency:currency
                        withBroker:self];
    
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency{
 
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency
                                     toCurrency:toCurrency]];
    
    NSNumber *invRate = @(1.0/rate);
    [self.rates setObject:invRate
                   forKey:[self keyFromCurrency:toCurrency
                                     toCurrency:fromCurrency]];
    
}

#pragma mark - Utils
-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

@end
