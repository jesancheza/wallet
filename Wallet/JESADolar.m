//
//  JESADolar.m
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESADolar.h"


@interface JESADolar ()
@property (nonatomic, readonly) NSUInteger amount;
@end

@implementation JESADolar

-(id)initWithAmount:(NSUInteger) amount{
    
    if (self = [super init]) {
        _amount = amount;
    }
    
    return self;
}

-(JESAMoney *) times:(NSUInteger) multiplier{
    return [[JESADolar alloc] initWithAmount:self.amount * multiplier];
}


#pragma mark - Equality
-(BOOL)isEqual:(id)object{
    return self.amount == [object amount];
}

@end
