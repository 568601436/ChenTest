//
//  NSString+StringExtension.m
//  ChenTest
//
//  Created by CHENGANG on 16/4/28.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import "NSString+StringExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (StringExtension)

+ (BOOL) isNullOrEmpty:(NSString *)string
{
    return string == nil
    || [string isEqual: (id)[NSNull null]]
    || [string isKindOfClass:[NSString class]] == NO
    || [@"" isEqualToString:string]
    || [@"<null>" isEqualToString:string]
    || [[string stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0U
    || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0U;
}

- (CGRect) getStringRectWith:(int)maxwidth maxheight:(int)maxheight
{
    UIFont *font = [UIFont systemFontOfSize: 14.0];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentLeft;
    return [self boundingRectWithSize: CGSizeMake(maxwidth, maxheight) options: NSStringDrawingUsesLineFragmentOrigin attributes: @{NSFontAttributeName: font,NSParagraphStyleAttributeName: paragraph} context: nil];
}
- (CGRect) getStringRectWith:(int)maxwidth maxheight:(int)maxheight fontSize:(float)size
{
    UIFont *font = [UIFont systemFontOfSize: size];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentLeft;
    return [self boundingRectWithSize: CGSizeMake(maxwidth, maxheight) options: NSStringDrawingUsesLineFragmentOrigin attributes: @{NSFontAttributeName: font,NSParagraphStyleAttributeName: paragraph} context: nil];
}

- (NSString *)toMD5
{
    const char *cStr = [self UTF8String];
    unsigned char result[32];
    CC_MD5(cStr,strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],result[1],result[2],result[3],
            result[4],result[5],result[6],result[7],
            result[8],result[9],result[10],result[11],
            result[12],result[13],result[14],result[15]];
}
@end
