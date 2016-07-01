//
//  CustomTabBar.m
//  qinren_guest
//
//  Created by yang on 16/6/9.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "CustomTabBar.h"

#import "UMSocial.h"

@interface CustomTabBar()<UMSocialUIDelegate>

@property (nonatomic,weak) UIButton *nbtn;

@end

@implementation CustomTabBar

/*初始化tabbar中间按钮*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *nbtn;
        
        nbtn= [UIButton buttonWithType:UIButtonTypeCustom];
        
        [nbtn setBackgroundImage:[UIImage imageNamed:@"tab_bar_Image_share_noselect"] forState:UIControlStateNormal];
        
        [nbtn setBackgroundImage:[UIImage imageNamed:@"tab_bar_Image_share_select"] forState:UIControlStateHighlighted];
        
        [nbtn addTarget:self action:@selector(mybtn) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:nbtn];
        
        self.nbtn = nbtn;
        
    }
    
    return self;
}

/*重新布局子视图(uitabbar隐藏性属tabbarbuttton)，调整中间按钮正确位置*/

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

-(void)mybtn
{
    
    [UMSocialData defaultData].extConfig.title = @"亲仁健康管理";
    
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    
    [UMSocialSnsService presentSnsIconSheetView:[self getCurrentVC]
     
                                         appKey:@"507fcab25270157b37000010"
     
                                      shareText:@"将软件分享到您的社交平台，您就可以获得亲仁公社赠送的消费积分，有惊喜哟!"
     
                                     shareImage:[UIImage imageNamed:@"share_icon"]
     
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
     
                                       delegate:self];



}

//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
