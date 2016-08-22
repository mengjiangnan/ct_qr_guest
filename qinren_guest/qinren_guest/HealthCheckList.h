//
//  HealthCheckList.h
//  qinren_guest
//
//  Created by qin_ren on 16/8/22.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthCheckList : NSObject

@property (nonatomic, copy) NSString *table_name;

@property (nonatomic, copy) NSString *dic_field_name;

@property (nonatomic, copy) NSString *monitor_unit;

@property (nonatomic, copy) NSString *monitor_img;

@property (nonatomic, copy) NSString *monitor_name;

@end
