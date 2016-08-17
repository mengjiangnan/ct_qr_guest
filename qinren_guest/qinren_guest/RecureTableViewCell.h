//
//  RecureTableViewCell.h
//  qinren_guest
//
//  Created by qin_ren on 16/8/17.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecureTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *sceneryimg;

@property (weak, nonatomic) IBOutlet UILabel *travelname;

@property (weak, nonatomic) IBOutlet UILabel *traveldes;

@property (weak, nonatomic) IBOutlet UIButton *reservationbtn;

@end
