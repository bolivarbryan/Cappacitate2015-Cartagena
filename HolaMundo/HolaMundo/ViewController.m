//
//  ViewController.m
//  HolaMundo
//
//  Created by Bryan A Bolivar M on 5/8/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)esconderTeclado:(id)sender {
}

- (IBAction)contratarDeportista:(UIButton *)sender {
    self.paisOrigen.text = @"Colombia";
    self.edad.text = @"31";
    self.nombreClub.text = @"Manchester United";
}

- (IBAction)limpiar:(id)sender {
    self.paisOrigen.text = @"";
    self.edad.text = @"";
    self.nombreClub.text = @"";
}

- (IBAction)actualizarNombre:(id)sender {
    self.nombreJugador.text = self.inputNombreJugador.text;
    
}







@end
