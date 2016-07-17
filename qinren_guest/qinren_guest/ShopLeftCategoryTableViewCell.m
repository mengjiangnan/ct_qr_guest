//
//  ShopLeftCategoryTableViewCell.m
//  qinren_guest
//
//  Created by yang on 16/7/17.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "ShopLeftCategoryTableViewCell.h"

#import "LeftCategoryList.h"

@implementation ShopLeftCategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setvalue:(LeftCategoryList *)list
{
    _list = list;
    
    self.textLabel.text = list.catename;
    
}
@end
