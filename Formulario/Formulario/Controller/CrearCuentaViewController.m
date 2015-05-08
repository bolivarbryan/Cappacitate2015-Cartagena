//
//  CrearCuentaViewController.m
//  Formulario
//
//  Created by Bryan A Bolivar M on 5/8/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import "CrearCuentaViewController.h"
#import "Usuario.h"
@interface CrearCuentaViewController ()

@end

@implementation CrearCuentaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)crearCuenta:(id)sender {
    Usuario *usuario = [[Usuario alloc] init];
    if ([usuario validarDatosDeUsuario:self.usuario.text conPassword:self.password.text yPasswordDeConfirmacion:self.passwordConfirm.text]){
        usuario.username = self.usuario.text;
        usuario.password = self.password.text;
        //ALERTAS
        [[[UIAlertView alloc] initWithTitle:@"Formulario" message:@"Usuario creado, Bienvenido" delegate:self cancelButtonTitle:@"Ok!" otherButtonTitles: nil] show];
    }else{
        if (self.usuario.text.length < 6) {
            self.usuario.textColor = [UIColor redColor];
            self.usuario.layer.borderColor=[[UIColor redColor]CGColor];
            [self vibrarTextfield:self.usuario];
        }
        if ([self.password.text isEqualToString:@""] ) {
                [self vibrarTextfield:self.password];
        }else{
            if (![self.password.text isEqualToString:self.passwordConfirm.text]) {
                [self vibrarTextfield:self.password];
                [self vibrarTextfield:self.passwordConfirm];
            }
        }
    }

}
-(void)vibrarTextfield: (UITextField *)textField{
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [textField setFrame:CGRectMake(textField.frame.origin.x - 10, textField.frame.origin.y, textField.frame.size.width, textField.frame.size.height)];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [textField setFrame:CGRectMake(textField.frame.origin.x + 20, textField.frame.origin.y, textField.frame.size.width, textField.frame.size.height)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                [textField setFrame:CGRectMake(textField.frame.origin.x - 10, textField.frame.origin.y, textField.frame.size.width, textField.frame.size.height)];
            } completion:^(BOOL finished) {
            }];
        }];
    }];
}

@end
