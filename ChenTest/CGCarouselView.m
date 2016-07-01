//
//  CGCarouselView.m
//  ChenTest
//
//  Created by CHENGANG on 16/5/26.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import "CGCarouselView.h"

@implementation CGCarouselView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initLocalImage:(CGRect )rect
{
    [self setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)];
    return nil;
}

@end
