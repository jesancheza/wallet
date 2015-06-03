//
//  JESAMoney.h
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JESAMoney : NSObject

@property (copy, readonly) NSString *currency;

+(instancetype) dollarWithAmount:(NSUInteger) amount;
+(instancetype) euroWithAmount:(NSUInteger) amount;

-(id)initWithAmount:(NSUInteger) amount
           currency:(NSString *) currency;

-(JESAMoney *) times:(NSUInteger) multiplier;
-(JESAMoney *) plus:(JESAMoney *) other;

@end
