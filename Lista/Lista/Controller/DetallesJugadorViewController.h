//
//  DetallesJugadorViewController.h
//  Lista
//
//  Created by Bryan A Bolivar M on 5/9/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Jugador.h"
@interface DetallesJugadorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *foto;
@property (weak, nonatomic) IBOutlet UILabel *posicion;
@property (weak, nonatomic) IBOutlet UILabel *goles;

@property (weak, nonatomic)  Jugador *player;

@end
