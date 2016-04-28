//
//  UIButton+CGUIButton.m
//  ChenTest
//
//  Created by CHENGANG on 16/4/28.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import "UIButton+CGUIButton.h"
#import "CGFileHelp.h"

@implementation UIButton (CGUIButton)
-(void)setWebImage:(NSString *)urlString placeHolder:(UIImage *)placeHolder{
    [self setImage:placeHolder forState:UIControlStateNormal];
    UIActivityIndicatorView *ai=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:ai];
    CGRect rect = self.frame;
    [ai setCenter:CGPointMake(rect.size.width/2, rect.size.height/2)];
    [ai startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *path=[CGFileHelp getImagePathWithUrl:[NSURL URLWithString:urlString]];
        NSData *data=[NSData dataWithContentsOfFile:path];
        if (!data) {
            data=[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            [data writeToFile:path atomically:YES];
        }
        UIImage *image=[UIImage imageWithData:data];
        if (image==nil) {
            image = placeHolder;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [ai stopAnimating];
            [ai removeFromSuperview];
            [self setImage:image forState:UIControlStateNormal];
        });
    });
}

- (void)setWEbFrameImage:(NSString *)urlString With:(CGFloat)with placeHolder:(UIImage *)placeHolder{
    [self setImage:placeHolder forState:UIControlStateNormal];
    UIActivityIndicatorView *ai=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:ai];
    CGRect rect = self.frame;
    [ai setCenter:CGPointMake(rect.size.width/2, rect.size.height/2)];
    [ai startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *path=[CGFileHelp getImagePathWithUrl:[NSURL URLWithString:urlString]];
        NSData *data=[NSData dataWithContentsOfFile:path];
        if (!data) {
            data=[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            [data writeToFile:path atomically:YES];
        }
        UIImage *image=[UIImage imageWithData:data];
        CGSize imagesize=CGSizeMake(with, with);
        UIGraphicsBeginImageContext(imagesize);
        CGRect rect = {{0,0}, imagesize};
        [image drawInRect: rect];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        if (image==nil) {
            image = placeHolder;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [ai stopAnimating];
            [ai removeFromSuperview];
            [self setImage:image forState:UIControlStateNormal];
        });
    });
}
@end
