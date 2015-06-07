//
//  JESABroker.h
//  Wallet
//
//  Created by Jose Enrique Sanchez Alfonso on 3/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JESAMoney.h"

@interface JESABroker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;

-(id<JESAMoney>) reduce:(id<JESAMoney>) money toCurrency:(NSString *) currency;

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency;

-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency;
@end
