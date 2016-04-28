//
//  CGToastHelperHUD.m
//  ChenTest
//
//  Created by CHENGANG on 16/4/28.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import "CGToastHelperHUD.h"

@implementation CGToastHelperHUD

+ (CGToastHelperHUD *)shareInstance{
    static CGToastHelperHUD *toast=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        toast = [[CGToastHelperHUD alloc]init];
    });
    return toast;
}

@end
