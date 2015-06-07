//
//  JESAWallet.m
//  Wallet
//
//  Created by Jose Enrique Sanchez Alfonso on 7/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAWallet.h"
#import "JESAMoney.h"

@interface JESAWallet ()
@property (nonatomic, strong) NSMutableArray *moneys;
@end

@implementation JESAWallet

-(NSUInteger) count{
    return [self.moneys count];
}

-(id) initWithAmount:(NSUInteger) amount currency:(NSString *) currency{
    
    if (self = [super init]) {
        JESAMoney *money = [[JESAMoney alloc] initWithAmount:amount
                                                    currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

-(id<JESAMoney>) plus:(JESAMoney *) money{
    
    [self.moneys addObject:money];
    
    return self;
}

-(id<JESAMoney>) times:(NSUInteger) multiplier{
    
    NSMutableArray *newsMoneys = [NSMutableArray arrayWithCapacity: self.moneys.count];
    
    for (JESAMoney *each in self.moneys) {
        JESAMoney *newMoney = [each times:multiplier];
        [newsMoneys addObject: newMoney];
    }
    
    self.moneys = newsMoneys;
    
    return self;
}

-(id<JESAMoney>) reduceToCurrency:(NSString *) currency
                       withBroker:(JESABroker *) broker{
    
    JESAMoney *result = [[JESAMoney alloc] initWithAmount:0 currency:currency];
    
    for (JESAMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    
    return result;
}

-(NSUInteger) numberOfCurrencies{
    
    NSSet *countCurrencies = [NSSet setWithArray:[self.moneys valueForKey:@"currency"]];
                              
    return [countCurrencies count];
}

@end
