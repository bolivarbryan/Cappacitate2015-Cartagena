//
//  HomeViewController.h
//  Formulario
//
//  Created by Bryan A Bolivar M on 5/8/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) Usuario *miUsuario;
@end
