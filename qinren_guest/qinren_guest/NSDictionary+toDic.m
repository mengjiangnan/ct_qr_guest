//
//  NSDictionary+toDic.m
//  qinren_guest
//
//  Created by qin_ren on 18/7/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "NSDictionary+toDic.h"

@implementation NSDictionary (toDic)

+(NSDictionary *) Key:(NSArray *)keys Value:(NSArray *)values

{
    
    
    NSDictionary *mydic = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    
    
    
    return mydic;
    
}




@end
