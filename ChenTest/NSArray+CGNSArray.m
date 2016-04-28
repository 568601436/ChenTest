//
//  NSArray+CGNSArray.m
//  ChenTest
//
//  Created by CHENGANG on 16/4/27.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import "NSArray+CGNSArray.h"

@implementation NSArray (CGNSArray)
- (id)objectNullAtIndex:(NSUInteger)index{
    if (self.count>index&&self!=nil) {
        return [self objectAtIndex:index];
    }
    return @"";
}
@end
