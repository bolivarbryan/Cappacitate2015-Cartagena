//
//  CeldaTableViewCell.h
//  Lista
//
//  Created by Bryan A Bolivar M on 5/9/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CeldaTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UILabel *posicion;
@property (weak, nonatomic) IBOutlet UILabel *goles;
@property (weak, nonatomic) IBOutlet UIImageView *foto;
-(void)cargarFotoDesdeURL:(NSString *)urlString;
@end
