//
//  ShopRightCategoryTableViewCell.h
//  qinren_guest
//
//  Created by qin_ren on 18/7/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopRightCategoryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *model_img;

@property (weak, nonatomic) IBOutlet UILabel *model_label_name;

@property (weak, nonatomic) IBOutlet UILabel *model_label_group_price;

@property (weak, nonatomic) IBOutlet UILabel *model_label_market_price;

@property (weak, nonatomic) IBOutlet UIButton *add_shop_car_button;

@property (weak, nonatomic) IBOutlet UIButton *buy_now_button;

@end
