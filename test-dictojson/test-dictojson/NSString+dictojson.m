//
//  NSString+dictojson.m
//  test-dictojson
//
//  Created by qin_ren on 8/7/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import "NSString+dictojson.h"

@implementation NSString (dictojson)

+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

@end
