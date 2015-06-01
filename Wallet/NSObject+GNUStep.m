//
//  NSObject+NSObject_GNUStep.m
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "NSObject+GNUStep.h"
@import ObjectiveC;

@implementation NSObject (GNUStep)

-(id) subclassResponsibility: (SEL)aSel{
    
    char prefix = class_isMetaClass(object_getClass(self)) ? '+': '-';
    
    [NSException raise: NSInvalidArgumentException
                format:@"%@%c%@ should be overriden by its subclass",
     NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    
    return self; // not reached
    
}

@end
