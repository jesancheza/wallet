//
//  JESAEuro.h
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JESAEuro : NSObject

@property (nonatomic, readonly) NSUInteger amount;

-(id)initWithAmount:(NSUInteger) amount;

-(void) times:(NSUInteger) multiplier;

@end
