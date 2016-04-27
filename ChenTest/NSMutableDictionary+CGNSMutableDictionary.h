//
//  NSMutableDictionary+CGNSMutableDictionary.h
//  ChenTest
//
//  Created by CHENGANG on 16/4/27.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (CGNSMutableDictionary)
/**
 *  判断是否为空
 *
 *  @param stringKey 键值
 *
 *  @return return value
 */
- (id)objectNullForKey:(NSString *)stringKey;
@end
