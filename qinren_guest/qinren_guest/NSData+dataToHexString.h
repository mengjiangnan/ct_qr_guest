//
//  NSData+dataToHexString.h
//  Algorithm_test
//
//  Created by qin_ren on 11/7/16.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (dataToHexString)

- (NSString *) dataToHexString;

+(NSData *)dataWithHexString:(NSString *)hexString;

@end
