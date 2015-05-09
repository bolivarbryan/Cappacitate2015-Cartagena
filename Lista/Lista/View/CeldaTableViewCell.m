//
//  CeldaTableViewCell.m
//  Lista
//
//  Created by Bryan A Bolivar M on 5/9/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import "CeldaTableViewCell.h"

@implementation CeldaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cargarFotoDesdeURL:(NSString *)urlString{
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlString]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.foto.image = [UIImage imageWithData: data];
        });
    });
}

@end
