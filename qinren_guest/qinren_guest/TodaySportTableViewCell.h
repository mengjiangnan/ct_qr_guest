//
//  TodaySportTableViewCell.h
//  qinren_guest
//
//  Created by qin_ren on 16/8/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodaySportTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *content;

@property (weak, nonatomic) IBOutlet UILabel *sporttitle;

@property (weak, nonatomic) IBOutlet UILabel *stylecontent;

@property (weak, nonatomic) IBOutlet UILabel *repeatcontent;

@property (weak, nonatomic) IBOutlet UITextView *sportcontent;

@property (weak, nonatomic) IBOutlet UITextView *sportadvice;

@property (weak, nonatomic) IBOutlet UITextView *mainbackgroud;


@end
