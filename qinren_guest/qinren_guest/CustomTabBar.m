//
//  CustomTabBar.m
//  qinren_guest
//
//  Created by yang on 16/6/9.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "CustomTabBar.h"

@interface CustomTabBar()

@property (nonatomic,weak) UIButton *nbtn;

@end

@implementation CustomTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *nbtn;
        
        nbtn= [UIButton buttonWithType:UIButtonTypeCustom];
        
        [nbtn setBackgroundImage:[UIImage imageNamed:@"tab_bar_Image_share_noselect"] forState:UIControlStateNormal];
        
        [nbtn setBackgroundImage:[UIImage imageNamed:@"tab_bar_Image_share_select"] forState:UIControlStateSelected];
        
        [self addSubview:nbtn];
        
        self.nbtn = nbtn;
        
    }
    
    return self;
}

- (void) layoutSubviews

{
    [super layoutSubviews];
    
    
    self.nbtn.frame = CGRectMake(0, 0, self.nbtn.currentBackgroundImage.size.width, self.nbtn.currentBackgroundImage.size.height);
    
    self.nbtn.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    
    CGFloat btn_y = 0;
    
    CGFloat btn_width = self.frame.size.width * 0.2;
    
    CGFloat btn_height = self.frame.size.height;
    
    NSInteger index = 0;
    
    for (UIView * btn in self.subviews) {
        
        if (![btn isKindOfClass:[UIControl class]] || btn == self.nbtn) continue;
        
        CGFloat btn_x = btn_width * ((index > 1)?(index + 1):index);
        
        btn.frame = CGRectMake(btn_x, btn_y, btn_width, btn_height);
        
        index++;
        
    }



}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
