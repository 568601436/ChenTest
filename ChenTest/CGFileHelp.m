//
//  CGFileHelp.m
//  ChenTest
//
//  Created by CHENGANG on 16/4/28.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import "CGFileHelp.h"
static NSString *IMAGE_CACHE_PATH = @"/Library/Caches/CGFile/Images/";
static NSString *VOICE_CACHE_PATH = @"/Library/Caches/CGFile/Voices/";

@implementation CGFileHelp

+ (CGFileHelp *)shareInstance{
    static CGFileHelp *file=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        file=[[CGFileHelp alloc]init];
        [file initFilePath];
    });
    return file;
}

+ (NSString *)createNewImagePath
{
    return [NSHomeDirectory() stringByAppendingFormat:@"%@IMG%ld.jpg", IMAGE_CACHE_PATH, (long)[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)createNewVoicePath
{
    return [NSHomeDirectory() stringByAppendingFormat:@"%@%ld.wav", VOICE_CACHE_PATH, (long)[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)createNewMp3VoicePath
{
    return [NSHomeDirectory() stringByAppendingFormat:@"%@%ld.wav", VOICE_CACHE_PATH, (long)[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)createNewVoiceAmrPath{
    return [NSHomeDirectory() stringByAppendingFormat:@"%@osell_%ld.amr", VOICE_CACHE_PATH, (long)[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)getImagePathWithUrl:(NSURL *)url
{
    NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"%@%lu.jpg", IMAGE_CACHE_PATH, (unsigned long)url.description.hash];;
    return  path;
}

+ (NSString *)getVoicePathWithUrl:(NSURL *)url
{
    NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"%@%lu.wav", VOICE_CACHE_PATH, (unsigned long)url.description.hash];;
    return  path;
}

+ (NSString *)getMp3VoicePathWithUrl:(NSURL *)url
{
    NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"%@%lu.amr", VOICE_CACHE_PATH, (unsigned long)url.description.hash];;
    return  path;
}

//初始化文件夹
- (void)initFilePath{
    NSArray *cachepaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    if (cachepaths && cachepaths.count > 0)
    {
        NSFileManager *manager = [NSFileManager defaultManager];
        NSError *error = nil;
        
        NSString *imagepath = [NSHomeDirectory() stringByAppendingString: IMAGE_CACHE_PATH];
        
        BOOL exists = [manager fileExistsAtPath: imagepath];
        
        if (!exists)
        {
            if (![manager createDirectoryAtPath: imagepath withIntermediateDirectories: YES attributes: nil error: &error])
            {
                //NSLog(@"%@", [error localizedDescription]);测试
            }
        }
        
        NSString *voicepath = [NSHomeDirectory() stringByAppendingString: VOICE_CACHE_PATH];
        
        exists = [manager fileExistsAtPath: voicepath];
        
        if (!exists)
        {
            if (![manager createDirectoryAtPath: voicepath withIntermediateDirectories: YES attributes: nil error: &error])
            {
                //NSLog(@"%@", [error localizedDescription]);
            }
        }
    }
}


//单个文件的大小
+ (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
//遍历文件夹获得文件夹大小，返回多少M
+ (float ) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [CGFileHelp fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}
//清理缓存
+ (void)clearLocalAllFile{
    NSString *path=[NSHomeDirectory() stringByAppendingString:IMAGE_CACHE_PATH];
    NSFileManager* manager = [NSFileManager defaultManager];
    NSArray *contents = [manager contentsOfDirectoryAtPath:path error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    NSString *filename;
    while ((filename = [e nextObject])) {
        [manager removeItemAtPath:[path stringByAppendingPathComponent:filename] error:NULL];
    }
    
    NSString *voicepath=[NSHomeDirectory() stringByAppendingString:VOICE_CACHE_PATH];
    NSArray *voicecontents = [manager contentsOfDirectoryAtPath:voicepath error:NULL];
    NSEnumerator *voicee = [voicecontents objectEnumerator];
    NSString *voicefilename;
    while ((voicefilename = [voicee nextObject])) {
        [manager removeItemAtPath:[voicepath stringByAppendingPathComponent:voicefilename] error:NULL];
    }
}
@end
