//
//  NSDictionary+CGNSDictionary.m
//  ChenTest
//
//  Created by CHENGANG on 16/4/27.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import "NSDictionary+CGNSDictionary.h"

@implementation NSDictionary (CGNSDictionary)
- (id)objectNullForKey:(NSString *)anAttribute{
    if ([[self allKeys] containsObject:anAttribute]) {
        return [self objectForKey:anAttribute];
    }
    return @"";
}
@end
