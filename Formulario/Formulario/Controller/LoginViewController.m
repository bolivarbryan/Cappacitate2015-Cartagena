//
//  LoginViewController.m
//  Formulario
//
//  Created by Bryan A Bolivar M on 5/8/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import "LoginViewController.h"
#import "Usuario.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"irAHomeSegue"]) {
        Usuario *user = [[Usuario alloc] init];
        user.username = self.username.text;
        user.password = self.password.text;
        [segue.destinationViewController setMiUsuario:user];
    }else{
        [self vibrarTextfield:self.password];
        [self vibrarTextfield:self.username];
    }
    
}

- (IBAction)crearCuenta:(id)sender {
    if ([self.username.text isEqualToString:@"usuariox"] && [self.password.text isEqualToString:@"123456"]) {
        [self performSegueWithIdentifier:@"irAHomeSegue" sender:self];
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
