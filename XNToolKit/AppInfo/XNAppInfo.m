//
//  XNAppInfo.m
//  XNToolKit
//
//  Created by Jiabao on 16/7/3.
//  Copyright © 2016年 XNToolKit. All rights reserved.
//

#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "XNAppInfo.h"

@implementation XNAppInfo

IMPLEMENTATION_SINGLETON(AppInfo)

- (instancetype)_init {
    return self;
}

#pragma mark - 获得应用程序版本
- (NSString *)appVersion {
    NSString *version = (__bridge id)CFBundleGetValueForInfoDictionaryKey(CFBundleGetMainBundle(), kCFBundleVersionKey);
    if (0 >= version.length) {
        version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleVersionKey];
    }
    return version;
}

#pragma mark - 获得应用程序名称
- (NSString*)appName {
    NSString *name = [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleExecutableKey];
    if (0 >= name.length) {
        name = [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleIdentifierKey];
    }
    return name;
}

#pragma mark - 获得设备系统名称
- (NSString*)systemName {
    return [[UIDevice currentDevice] systemName];
}

#pragma mark - 获得设备系统版本
- (NSString*)systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

#pragma mark - 获得屏幕分辨率
- (CGRect)mainScreenBounds {
    return [[UIScreen mainScreen] bounds];
}

- (CGRect)mainScreenSize {
    return [[UIScreen mainScreen] bounds];
}

#pragma mark - 计算屏幕分辨率
- (CGFloat)mainScreenScale {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        return [[UIScreen mainScreen] scale];
    }
    return 1.0f;
}


#pragma mark - 获取承运商名称
- (NSString*)carrierName {
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    return [[carrier carrierName] copy];
}


#pragma mark - 获得路径
- (NSString*)directoryForType:(XNAppInfoDirectoryType)directoryType {
    switch (directoryType) {
        case XNAppInfoDirectoryTypeHome:
            return [self homeDirectory];
            break;
            
        case XNAppInfoDirectoryTypeDocument:
            return [self documentDirectory];
            break;
            
        case XNAppInfoDirectoryTypeLibrary:
            return [self libraryDirectory];
            break;
            
        case XNAppInfoDirectoryTypeCaches:
            return [self cachesDirectory];
            break;
            
        case XNAppInfoDirectoryTypeTmp:
            return [self tmpDirectory];
            break;
            
        default:
            break;
    }
    return @"";
}

#pragma mark - 获取Home目录
- (NSString*)homeDirectory {
    return NSHomeDirectory();
}

#pragma mark - 获取Document目录
- (NSString*)documentDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

#pragma mark - 获取Library目录
- (NSString*)libraryDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

#pragma mark - 获取Caches目录
- (NSString*)cachesDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

#pragma mark - 获取Tmp目录
- (NSString*)tmpDirectory {
    return NSTemporaryDirectory();
}

#pragma mark - 通过文件夹名称获取路径
- (NSString*)folderPathForName:(NSString *)folderName inDirectory:(XNAppInfoDirectoryType)directoryType {
    return [[self directoryForType:directoryType] stringByAppendingPathComponent:folderName];
}

#pragma mark - 通过文件夹路径判断文件夹是否存在
- (BOOL)folderExistsForPath:(NSString *)folderPath {
    BOOL isDir = NO;
    if ([[NSFileManager defaultManager] fileExistsAtPath:folderPath isDirectory:&isDir]) {
        return isDir;
    }
    return NO;
}

#pragma mark - 通过文件夹名称判断文件夹是否存在
- (BOOL)folderExistsForName:(NSString *)folderName inDirectory:(XNAppInfoDirectoryType)directoryType {
    NSString *folderPath = [self folderPathForName:folderName inDirectory:directoryType];
    return [self folderExistsForPath:folderPath];
}

#pragma mark - 通过文件夹路径创建文件夹 成功返回路径, 失败返回nil
- (NSString*)createFolderAtPath:(NSString *)folderPath {
    if ([self folderExistsForPath:folderPath]) {
        return folderPath;
    }
    if ([[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil]) {
        return folderPath;
    }
    return nil;
}

#pragma mark - 通过文件夹名称创建文件夹 成功返回路径, 失败返回nil
- (NSString*)createFolderAtName:(NSString *)folderName inDirectory:(XNAppInfoDirectoryType)directoryType {
    NSString *folderPath = [self folderPathForName:folderName inDirectory:directoryType];
    return [self createFolderAtPath:folderPath];
}

#pragma mark - 通过文件名获取文件路径
- (NSString*)filePathForName:(NSString *)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType {
    NSString *fullFileName = [self checkFileNameHaveSuffix:fileName suffix:suffix];
    return [[self directoryForType:directoryType] stringByAppendingPathComponent:fullFileName];
}

#pragma mark - 判断文件是否存在
- (BOOL)fileExistsForName:(NSString *)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType {
    NSString *path = [self filePathForName:fileName andSuffix:suffix inDirectory:directoryType];
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

#pragma mark - 读写文件 (结果为 NSMutableDictionary* 或 NSMutableArray*)
- (NSMutableDictionary*)readDictForFile:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType {
    NSString *filePath = [self filePathForName:fileName andSuffix:suffix inDirectory:directoryType];
    NSMutableDictionary *dict = nil;
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        dict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }
    return dict;
}

- (NSMutableArray*)readArrayForFile:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType {
    NSString *filePath = [self filePathForName:fileName andSuffix:suffix inDirectory:directoryType];
    NSMutableArray *array = nil;
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        array = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    }
    return array;
}

- (BOOL)writeDictToFile:(NSDictionary*)dict fileName:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType {
    NSString *filePath = [self filePathForName:fileName andSuffix:suffix inDirectory:directoryType];
    return [dict writeToFile:filePath atomically:YES];
}

- (BOOL)writeArrayToFile:(NSArray*)array fileName:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType {
    NSString *filePath = [self filePathForName:fileName andSuffix:suffix inDirectory:directoryType];
    return [array writeToFile:filePath atomically:YES];
}

#pragma mark - 读写plist文件 (结果为 NSMutableDictionary* 或 NSMutableArray*)

- (NSMutableDictionary *)readDictForPlistFile:(NSString *)fileName inDirectory:(XNAppInfoDirectoryType)directoryType {
    return [self readDictForFile:fileName andSuffix:@"plist" inDirectory:directoryType];
}

- (NSMutableArray *)readArrayForPlistFile:(NSString *)fileName inDirectory:(XNAppInfoDirectoryType)directoryType {
    return [self readArrayForFile:fileName andSuffix:@"plist" inDirectory:directoryType];
}

- (BOOL)writeDictToPlistFile:(NSDictionary *)dict fileName:(NSString *)fileName inDirectory:(XNAppInfoDirectoryType)directoryType {
    return [self writeDictToFile:dict fileName:fileName andSuffix:@"plist" inDirectory:directoryType];
}

- (BOOL)writeArrayToPlistFile:(NSArray *)array fileName:(NSString *)fileName inDirectory:(XNAppInfoDirectoryType)directoryType {
    return [self writeArrayToFile:array fileName:fileName andSuffix:@"plist" inDirectory:directoryType];
}

#pragma mark - 检查后缀名
- (NSString*)checkFileNameHaveSuffix:(NSString*)fileName suffix:(NSString*)suffix {
    NSString *fullFileName = nil;
    if ([fileName hasSuffix:[NSMutableString stringWithFormat:@".%@", suffix]]) {
        fullFileName = fileName;
    } else {
        fullFileName = [[NSString alloc] initWithFormat:@"%@.%@", fileName, suffix];
    }
    return fullFileName;
}

@end
