//
//  JESAMoney.h
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JESAMoney : NSObject

-(id)initWithAmount:(NSUInteger) amount;

-(JESAMoney *) times:(NSUInteger) multiplier;

@end
