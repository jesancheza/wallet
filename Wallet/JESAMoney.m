//
//  JESAMoney.m
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAMoney.h"

#import "NSObject+GNUStep.h"

@implementation JESAMoney

-(id) initWithAmount:(NSUInteger)amount{
    return [self subclassResponsibility:_cmd];
}

-(JESAMoney *) times:(NSUInteger)multiplier{
    return [self subclassResponsibility:_cmd];
}

@end
