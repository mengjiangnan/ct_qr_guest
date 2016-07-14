//
//  NSString+dictojson.h
//  test-dictojson
//
//  Created by qin_ren on 8/7/16.
//  Copyright © 2016年 qiren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (dictojson)

+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

@end
