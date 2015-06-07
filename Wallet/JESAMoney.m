//
//  JESAMoney.m
//  Wallet
//
//  Created by José Enrique Sanchez on 1/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import "JESAMoney.h"
#import "JESABroker.h"

@interface JESAMoney ()
@property (nonatomic, strong) NSNumber *amount;
@end

@implementation JESAMoney

+(instancetype) dollarWithAmount:(NSUInteger) amount{
    JESAMoney *dollar = [[JESAMoney alloc] initWithAmount:amount
                                                     currency:@"USD"];
    
    return dollar;
}

+(instancetype) euroWithAmount:(NSUInteger) amount{
    
    JESAMoney *euro = [[JESAMoney alloc] initWithAmount:amount
                                               currency:@"EUR"];
    
    return euro;
    
}

-(id)initWithAmount:(NSUInteger) amount
           currency:(NSString *)currency{
    
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    
    return self;
}

-(id<JESAMoney>) times:(NSUInteger) multiplier{
    return [[JESAMoney alloc]
            initWithAmount:[self.amount integerValue] *
            multiplier currency:self.currency];
}

-(id<JESAMoney>) plus:(JESAMoney *) other{
    
    NSUInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    JESAMoney *total = [[JESAMoney alloc] initWithAmount:totalAmount currency:self.currency];
    
    return total;
}

-(id<JESAMoney>) reduceToCurrency:(NSString *) currency
                       withBroker:(JESABroker *) broker{
    
    JESAMoney *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency
                                                           toCurrency:currency]] doubleValue];
    
    // Comprobamos que divisa de origen y destino sean las mismas
    if ([self.currency isEqual:currency]) {
        result = self;
    }else if (rate == 0){
        // NO hay tasa de conversión, lanzamos excepción
        [NSException  raise:@"NoConversionRateException"
                     format:@"Must have a conversion from %@ to %@", self.currency, currency];
    }else{
        
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[JESAMoney alloc] initWithAmount:newAmount
                                          currency:currency];
    }
    
    return result;
    
}

#pragma mark - Equality
-(BOOL)isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency] ]) {
        return self.amount == [object amount];
    }else{
        return NO;
    }
    
}

#pragma mark - Overwritten
-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@: %@ %@>",
            [self class], [self currency], [self amount]];
}

-(NSUInteger) hash{
    return [self.amount integerValue];
}

@end
