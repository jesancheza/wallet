//
//  JESAMoney.h
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JESAMoney;
@class JESABroker;

@protocol JESAMoney <NSObject>

-(id)initWithAmount:(NSUInteger) amount
           currency:(NSString *) currency;

-(id<JESAMoney>) times:(NSUInteger) multiplier;
-(id<JESAMoney>) plus:(JESAMoney *) other;

-(id<JESAMoney>) reduceToCurrency:(NSString *) currency
                       withBroker:(JESABroker *) broker;

@end

@interface JESAMoney : NSObject<JESAMoney>

@property (nonatomic, strong, readonly) NSNumber *amount;
@property (copy, readonly) NSString *currency;

+(instancetype) dollarWithAmount:(NSUInteger) amount;
+(instancetype) euroWithAmount:(NSUInteger) amount;



@end
