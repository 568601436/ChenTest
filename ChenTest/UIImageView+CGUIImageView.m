//
//  UIImageView+CGUIImageView.m
//  ChenTest
//
//  Created by CHENGANG on 16/4/27.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import "UIImageView+CGUIImageView.h"
#import "CGFileHelp.h"

@implementation UIImageView (CGUIImageView)
//异步设置图片
-(void)setAsynchronousImage:(NSString *)imageString defaultImage:(UIImage *)placeholder{
    NSString *path = [CGFileHelp getImagePathWithUrl: [NSURL URLWithString:imageString]];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSData *data = [NSData dataWithContentsOfFile: path];
        UIImage *image = nil;
        if (data && data.length > 0) {
            image = [UIImage imageWithData:data];
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.image = placeholder;
            });
            data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageString]];
            if (data && data.length > 0) {
                [data writeToFile: path atomically: YES];
                image = [UIImage imageWithData: data];
            }else{
                return;
            }
        }
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.image = image;
        });
    });
}

@end
