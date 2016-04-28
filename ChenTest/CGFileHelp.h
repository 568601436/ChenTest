//
//  CGFileHelp.h
//  ChenTest
//
//  Created by CHENGANG on 16/4/28.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGFileHelp : NSObject
/**
 *  返回单利
 *
 *  @return CGFileHelp
 */
+ (CGFileHelp *)shareInstance;

+ (NSString *)getImagePathWithUrl:(NSURL *)url;
+ (NSString *)getVoicePathWithUrl:(NSURL *)url;
+ (NSString *)getMp3VoicePathWithUrl:(NSURL *)url;

+ (NSString *)createNewImagePath;
+ (NSString *)createNewVoicePath;
+ (NSString *)createNewMp3VoicePath;
+ (NSString *)createNewVoiceAmrPath;


/**
 *  单个文件的大小
 *
 *  @param filePath 文件路径
 *
 *  @return 文件大小
 */
+ (long long) fileSizeAtPath:(NSString*) filePath;
/**
 *  遍历文件夹获得文件夹大小，返回多少M
 *
 *  @param folderPath 文件夹路径
 *
 *  @return 返回多少M
 */
+ (float ) folderSizeAtPath:(NSString*) folderPath;
/**
 *  清理本地缓存
 */
+ (void)clearLocalAllFile;
@end
