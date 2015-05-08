//
//  ViewController.h
//  HolaMundo
//
//  Created by Bryan A Bolivar M on 5/8/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *fotoPerfiles;
@property (weak, nonatomic) IBOutlet UILabel *nombreJugador;
@property (weak, nonatomic) IBOutlet UILabel *paisOrigen;
@property (weak, nonatomic) IBOutlet UILabel *edad;
@property (weak, nonatomic) IBOutlet UILabel *nombreClub;
@property (weak, nonatomic) IBOutlet UIButton *botonContratar;
@property (weak, nonatomic) IBOutlet UITextField *inputNombreJugador;

- (IBAction)esconderTeclado:(id)sender;
- (IBAction)contratarDeportista:(UIButton *)sender;
- (IBAction)limpiar:(id)sender;
- (IBAction)actualizarNombre:(id)sender;

@end

