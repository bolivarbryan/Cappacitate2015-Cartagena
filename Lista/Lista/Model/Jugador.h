//
//  Usuario.h
//  Lista
//
//  Created by Bryan A Bolivar M on 5/9/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Jugador : NSObject
@property (nonatomic, assign) NSString * nombre;
@property (nonatomic, assign) NSNumber * goles;
@property (nonatomic, assign) NSURL * fotoUrl;
@property (nonatomic, assign) NSString * posicion;
@end
