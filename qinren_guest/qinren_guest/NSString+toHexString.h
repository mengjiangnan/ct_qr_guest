//
//  NSString+toHexString.h
//  Algorithm_test
//
//  Created by yang on 16/7/9.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (toHexString)

+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;

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

+(NSString *)DicMethod:(NSString*)method Params:(NSDictionary *)params;

//unicode编码以\u开头
+ (NSString *)replaceUnicode:(NSString *)unicodeStr;

//uri编码
+ (NSString *)encodeToPercentEscapeString: (NSString *) input;


@end
