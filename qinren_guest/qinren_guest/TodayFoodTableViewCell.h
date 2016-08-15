//
//  TodayFoodTableViewCell.h
//  qinren_guest
//
//  Created by qin_ren on 16/8/15.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayFoodTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *foodimg;

@property (weak, nonatomic) IBOutlet UILabel *foodname;

@property (weak, nonatomic) IBOutlet UIButton *change;

@property (weak, nonatomic) IBOutlet UITextView *content;


@end
