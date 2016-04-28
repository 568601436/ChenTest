//
//  UIImageView+CGUIImageView.h
//  ChenTest
//
//  Created by CHENGANG on 16/4/27.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CGUIImageView)
/**
 *  异步设置图片
 *
 *  @param imageString 图片地址
 *  @param image       默认图片
 *
 *  @return 返回Image
 */
-(void)setAsynchronousImage:(NSString *)imageString defaultImage:(UIImage *)placeholder;

@end
