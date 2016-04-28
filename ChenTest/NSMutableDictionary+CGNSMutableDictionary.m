//
//  NSMutableDictionary+CGNSMutableDictionary.m
//  ChenTest
//
//  Created by CHENGANG on 16/4/27.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import "NSMutableDictionary+CGNSMutableDictionary.h"

@implementation NSMutableDictionary (CGNSMutableDictionary)
- (id)objectNullForKey:(NSString *)anAttribute{
    if ([[self allKeys] containsObject:anAttribute]) {
        return [self objectForKey:anAttribute];
    }
    return @"";
}
@end
