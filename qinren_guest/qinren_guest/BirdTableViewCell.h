//
//  BirdTableViewCell.h
//  qinren_guest
//
//  Created by qin_ren on 16/8/19.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BirdTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *citythree;

@property (weak, nonatomic) IBOutlet UITextField *starttime;

@property (weak, nonatomic) IBOutlet UITextField *endtime;

@property (weak, nonatomic) IBOutlet UITextField *basename;

@property (weak, nonatomic) IBOutlet UITextField *reservationnum;

@property (weak, nonatomic) IBOutlet UIButton *checkbtn;

@property (weak, nonatomic) IBOutlet UIPickerView *mypickerview;

@property (weak, nonatomic) IBOutlet UIDatePicker *mypickdate;

@end
