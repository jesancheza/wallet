//
//  JESAControllerTests.m
//  Wallet
//
//  Created by Jose Enrique Sanchez Alfonso on 7/6/15.
//  Copyright (c) 2015 Devappify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "JESASimpleViewController.h"
#import "JESAWalletTableViewController.h"
#import "JESAWallet.h"

@interface JESAControllerTests : XCTestCase
@property (nonatomic, strong) JESASimpleViewController  *simpleVC;
@property (nonatomic, strong) UIButton  *button;
@property (nonatomic, strong) UILabel  *label;

@property (nonatomic, strong) JESAWalletTableViewController *walletVC;
@property (nonatomic, strong) JESAWallet *wallet;
@end

@implementation JESAControllerTests

- (void)setUp {
    [super setUp];
    // Creamos el entorno de laboratorio
    self.simpleVC = [[JESASimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
    self.wallet = [[JESAWallet alloc] initWithAmount:1
                                            currency:@"USD"];
    [self.wallet plus:[JESAMoney euroWithAmount:1]];
    
    self.walletVC = [[JESAWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown {

    [super tearDown];
    // Lo destruimos
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

-(void) testThatTextOnLableIsEqualToTextOnButton{
    
    // Mandamos el mensaje
    [self.simpleVC  displayText:self.button];
    
    // Comprobamos que etiqueta y botón tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text,@"Button and label should have the same text");
    
}

-(void) testThatTablehasSameSectionsThatTypeCurrencyPlusOne{
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(sections, [self.wallet numberOfCurrencies] +1,@"Number of sections should be the same that number of currency");
}


// Tests curso online
//-(void) testThatTablehasOneSection{
//    
//    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
//    XCTAssertEqual(sections, 1, @"Sections should be 1");
//}
//
//-(void) testThatNumberOfCellsIsNumberOfMoneysPlusOne{
//    
//    XCTAssertEqual(self.wallet.count + 1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys plus 1 (the total)");
//}

@end
