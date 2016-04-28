//
//  UIButton+CGUIButton.h
//  ChenTest
//
//  Created by CHENGANG on 16/4/28.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CGUIButton)
/**
 *  异步设置按钮图片
 *
 *  @param aUrl        图片地址
 *  @param placeHolder 默认图片
 */
-(void)setWebImage:(NSString *)urlString placeHolder:(UIImage *)placeHolder;
/**
 *  异步设置按钮图片
 *
 *  @param aUrl        图片地址
 *  @param with        按钮宽度和高度
 *  @param placeHolder 默认图片
 */
- (void)setWEbFrameImage:(NSString *)urlString With:(CGFloat)with placeHolder:(UIImage *)placeHolder;
@end
