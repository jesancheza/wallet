//
//  JESAEuro.m
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAEuro.h"

@interface JESAEuro()
@property (nonatomic, readonly) NSUInteger amount;
@end

@implementation JESAEuro

-(id)initWithAmount:(NSUInteger) amount{
    
    if (self = [super init]) {
        _amount = amount;
    }
    
    return self;
}

-(JESAMoney *) times:(NSUInteger) multiplier{
    return [[JESAEuro alloc] initWithAmount:self.amount * multiplier];
}


#pragma mark - Equality
-(BOOL)isEqual:(id)object{
    return self.amount == [object amount];
}

@end
