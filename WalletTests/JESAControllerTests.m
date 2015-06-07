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

@interface JESAControllerTests : XCTestCase
@property (nonatomic, strong) JESASimpleViewController  *simpleVC;
@property (nonatomic, strong) UIButton  *button;
@property (nonatomic, strong) UILabel  *label;
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

@end
