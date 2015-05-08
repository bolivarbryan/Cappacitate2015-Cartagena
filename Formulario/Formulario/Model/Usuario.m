//
//  Usuario.m
//  Formulario
//
//  Created by Bryan A Bolivar M on 5/8/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario

-(BOOL)validarDatosDeUsuario:(NSString *)usuario conPassword: (NSString *)password yPasswordDeConfirmacion:(NSString *)passwordConfirm{
    if ((usuario.length < 6) || password.length < 6 || ![password isEqualToString:passwordConfirm])
        return false;
    return true;
}

@end
