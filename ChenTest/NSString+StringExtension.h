//
//  NSString+StringExtension.h
//  ChenTest
//
//  Created by CHENGANG on 16/4/28.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (StringExtension)

/**
 *  判断是否为空
 *
 *  @param string 判断的值
 *
 *  @return BOOL
 */
+ (BOOL) isNullOrEmpty:(NSString *)string;

/**
 *  计算字符串的高度
 *
 *  @param maxwidth  最大宽度
 *  @param maxheight 最大高度
 *
 *  @return CGRect
 */
- (CGRect)getStringRectWith:(int)maxwidth maxheight:(int)maxheight;
/**
 *  计算字符串高度
 *
 *  @param maxwidth  最大宽度
 *  @param maxheight 最大高度
 *  @param size      字体大小
 *
 *  @return CGRect
 */
- (CGRect) getStringRectWith:(int)maxwidth maxheight:(int)maxheight fontSize:(float)size;
/**
 *  md5加密2
 *
 *  @return 返回加密字符串
 */
- (NSString *)toMD5;
@end
