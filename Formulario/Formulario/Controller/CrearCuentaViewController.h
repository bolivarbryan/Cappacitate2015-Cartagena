//
//  CrearCuentaViewController.h
//  Formulario
//
//  Created by Bryan A Bolivar M on 5/8/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrearCuentaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usuario;

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UITextField *passwordConfirm;

- (IBAction)crearCuenta:(id)sender;

@end
