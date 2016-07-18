//
//  ShopRightCategoryTableViewCell.m
//  qinren_guest
//
//  Created by qin_ren on 18/7/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "ShopRightCategoryTableViewCell.h"

@interface ShopRightCategoryTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *right_img;

@end


@implementation ShopRightCategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
