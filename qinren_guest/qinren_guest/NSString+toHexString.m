//
//  NSString+toHexString.m
//  Algorithm_test
//
//  Created by yang on 16/7/9.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "NSString+toHexString.h"

#import "NSData+dataToHexString.h"

#import "GTMBase64.h"

#import <CommonCrypto/CommonCrypto.h>


@implementation NSString (toHexString)

//md5加密

- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ]; 
}

+ (NSString *)md5HexDigest:(NSString*)input
{
   
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (int)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        
        [ret appendFormat:@"%02x",result[i]];
        
    }
    return [ret uppercaseString];
}

//Byte数组转字符串

+(NSString *)toHexString:(Byte *)byte
{
    
    NSMutableString *hexStr = [[NSMutableString alloc]init];
    
    int i = 0;
    
    if (byte) {
        
        while (byte[i] != '\0') {
            
            NSString *hexByte = [NSString stringWithFormat:@"%x",byte[i] & 0xff];
            
            if (hexByte.length == 1) {
                
                [hexStr appendFormat:@"0%@",hexByte];
                
            }else {
            
                [hexStr appendFormat:@"%@",hexByte];
            
            }
            
            i++;
        }
    }
    
        return [hexStr uppercaseString];

}



//3DES 加密

//const Byte iv[] = { 0x19, 0x3E, 0x15, 0x43, 0x2D, 0x56, 0x14, 0x3C };
//const Byte iv[] = { 83, 68, 70, 76, 35, 41, 64, 70 };
//const Byte iv[] ={};

+(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key
{

    NSData * dataiv = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *ciphertext = nil;
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [textData length];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          [dataiv bytes],
                                          //iv,
                                          [textData bytes],
                                          dataLength,
                                          buffer,
                                          44096,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        
        Byte* bb = (Byte*)[data bytes];
        
        
        ciphertext = [[NSString toHexString:bb]stringByRemovingPercentEncoding];
 
        
    }
   
    return [ciphertext uppercaseString];
}


//3DES 解密

+(NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key
{
         NSData * dataiv = [key dataUsingEncoding:NSUTF8StringEncoding];
         NSString *plaintext = nil;
         NSData *cipherdata = [NSData dataWithHexString:cipherText];
         unsigned char buffer[1024];
         memset(buffer, 0, sizeof(char));
         size_t numBytesDecrypted = 0;
         CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                       kCCOptionPKCS7Padding,
                                       [key UTF8String], kCCKeySizeDES,
                                       [dataiv bytes],
                                       //iv,
                                       [cipherdata bytes], [cipherdata length],
                                       buffer, 44096,
                                       &numBytesDecrypted);
         if(cryptStatus == kCCSuccess) {
                 NSData *plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
                 
             
                 plaintext = [[[NSString alloc]initWithData:plaindata encoding:NSUTF8StringEncoding]stringByRemovingPercentEncoding];
             }
         return plaintext;
     }

@end
