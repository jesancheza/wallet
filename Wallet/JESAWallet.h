//
//  JESAWallet.h
//  Wallet
//
//  Created by Jose Enrique Sanchez Alfonso on 7/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JESAMoney.h"

@interface JESAWallet : NSObject<JESAMoney>

@property (nonatomic, readonly) NSUInteger count;

@end
