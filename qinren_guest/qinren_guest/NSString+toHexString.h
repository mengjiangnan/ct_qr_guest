//
//  NSString+toHexString.h
//  Algorithm_test
//
//  Created by yang on 16/7/9.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (toHexString)

+(NSString*)dictionaryToJson:(NSDictionary *)dic;

- (NSString *)md5;

+ (NSString *)md5HexDigest:(NSString*)input;

+(NSString *)toHexString:(Byte *)byte;

+(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;

+(NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;

//jsonparams获取方法
+(NSString *) Key:(NSArray *)keys Value:(NSArray *)values;

//拼接url方法
+(NSString *)Method:(NSString*)method Params:(NSString*)params;


@end
