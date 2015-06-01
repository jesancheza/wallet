//
//  JESAEuro.m
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAEuro.h"

@implementation JESAEuro

-(id)initWithAmount:(NSUInteger) amount{
    
    if (self = [super init]) {
        _amount = amount;
    }
    
    return self;
}

-(void) times:(NSUInteger) multiplier{
    
    _amount = _amount * multiplier;
}

@end
