//
//  JESAMoney.m
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAMoney.h"

@interface JESAMoney ()
@property (nonatomic, strong, readonly) NSNumber *amount;
@end

@implementation JESAMoney

+(instancetype) dollarWithAmount:(NSUInteger) amount{
    JESAMoney *dollar = [[JESAMoney alloc] initWithAmount:amount
                                                     currency:@"USD"];
    
    return dollar;
}

+(instancetype) euroWithAmount:(NSUInteger) amount{
    
    JESAMoney *euro = [[JESAMoney alloc] initWithAmount:amount
                                               currency:@"EUR"];
    
    return euro;
    
}

-(id)initWithAmount:(NSUInteger) amount
           currency:(NSString *)currency{
    
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    
    return self;
}

-(JESAMoney *) times:(NSUInteger) multiplier{
    return [[JESAMoney alloc]
            initWithAmount:[self.amount integerValue] *
            multiplier currency:self.currency];
}

#pragma mark - Equality
-(BOOL)isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency] ]) {
        return self.amount == [object amount];
    }else{
        return NO;
    }
    
}

#pragma mark - Overwritten
-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@ %ld",
            [self class], (long)[self amount]];
}

-(NSUInteger) hash{
    return (NSUInteger) self.amount;
}

@end
