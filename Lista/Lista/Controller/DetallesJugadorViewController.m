//
//  DetallesJugadorViewController.m
//  Lista
//
//  Created by Bryan A Bolivar M on 5/9/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import "DetallesJugadorViewController.h"

@interface DetallesJugadorViewController ()

@end

@implementation DetallesJugadorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"SELECCIONASTE A: %@", self.player.nombre);
    self.title = self.player.nombre;
    self.goles.text = [NSString stringWithFormat:@"%@",self.player.goles];
    self.posicion.text = self.player.posicion;
    
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: self.player.fotoUrl];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.foto.image = [UIImage imageWithData: data];
        });
    });


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

@end
