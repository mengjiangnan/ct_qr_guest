//
//  ShopCarTableViewCell.m
//  qinren_guest
//
//  Created by qin_ren on 28/6/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "ShopCarTableViewCell.h"

@interface ShopCarTableViewCell()

@property (nonatomic,weak) UIImageView *goods_imgview;

@property (nonatomic,weak) UILabel *goods_name_label;

@end

@implementation ShopCarTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableview
{
    static NSString *identifier = @"shop_car_cell";
    
    // 1.缓存中取
    
    ShopCarTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    
    // 2.创建
    
    if (cell == nil) {
        
        cell = [[ShopCarTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }


    return cell;

}

/*
  
  构造方法(在初始化对象的时候会调用)
  
  一般在这个方法中添加需要显示的子控件
 
 */

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // 让自定义Cell和系统的cell一样, 一创建出来就拥有一些子控件提供给我们使用
        
        // 1.创建商品图片
        
        UIImageView *goods_imgview = [[UIImageView alloc]init];
        
        [self.contentView addSubview:goods_imgview];
        
        self.goods_imgview = goods_imgview;
        
        // 2.创建商品名称
        
        UILabel *goods_name_label = [[UILabel alloc]init];
        
        goods_name_label.font = [UIFont systemFontOfSize:12.0];
        
        [self.contentView addSubview:goods_name_label];
        
        self.goods_name_label = goods_name_label;
        
    }
    
    return self;


}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
