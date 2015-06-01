//
//  JESAMoney.m
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAMoney.h"

#import "NSObject+GNUStep.h"

@interface JESAMoney ()
@property (nonatomic, readonly) NSUInteger amount;
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
        _amount = amount;
        _currency = currency;
    }
    
    return self;
}

-(JESAMoney *) times:(NSUInteger) multiplier{
    return [JESAMoney
            euroWithAmount:self.amount * multiplier];
}

#pragma mark - Equality
-(BOOL)isEqual:(id)object{
    return self.amount == [object amount];
}

@end
