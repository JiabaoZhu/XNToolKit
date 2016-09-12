//
//  XNAppInfo.h
//  XNToolKit
//
//  Created by Jiabao on 16/7/3.
//  Copyright © 2016年 XNToolKit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XNHelperDefine.h"

typedef NS_ENUM(NSUInteger, XNAppInfoDirectoryType) {
    XNAppInfoDirectoryTypeNone = 0,
    XNAppInfoDirectoryTypeHome = 1,
    XNAppInfoDirectoryTypeDocument,
    XNAppInfoDirectoryTypeLibrary,
    XNAppInfoDirectoryTypeCaches,
    XNAppInfoDirectoryTypeTmp
};

@interface XNAppInfo : NSObject

INTERFACE_SINGLETON(AppInfo)

#pragma mark - 获得应用程序版本
- (NSString*)appVersion;

#pragma mark - 获得应用程序名称
- (NSString*)appName;

#pragma mark - 获得设备系统名称
- (NSString*)systemName;

#pragma mark - 获得设备系统版本
- (NSString*)systemVersion;

#pragma mark - 获得屏幕分辨率
- (CGRect)mainScreenBounds;
- (CGRect)mainScreenSize;

#pragma mark - 计算屏幕分辨率
- (CGFloat)mainScreenScale;


// 运营商
#pragma mark - 获取承运商名称
- (NSString*)carrierName;



#pragma mark - 获得路径
- (NSString*)directoryForType:(XNAppInfoDirectoryType)directoryType;

#pragma mark - 获取Home目录
- (NSString*)homeDirectory;

#pragma mark - 获取Document目录
- (NSString*)documentDirectory;

#pragma mark - 获取Library目录
- (NSString*)libraryDirectory;

#pragma mark - 获取Caches目录
- (NSString*)cachesDirectory;

#pragma mark - 获取Tmp目录
- (NSString*)tmpDirectory;


#pragma mark - 通过文件夹名称获取路径
- (NSString*)folderPathForName:(NSString *)folderName inDirectory:(XNAppInfoDirectoryType)directoryType;

#pragma mark - 通过文件夹路径判断文件夹是否存在
- (BOOL)folderExistsForPath:(NSString *)folderPath;

#pragma mark - 通过文件夹名称判断文件夹是否存在
- (BOOL)folderExistsForName:(NSString *)folderName inDirectory:(XNAppInfoDirectoryType)directoryType;

#pragma mark - 通过文件夹路径创建文件夹 成功返回路径, 失败返回nil
- (NSString*)createFolderAtPath:(NSString *)folderPath;

#pragma mark - 通过文件夹名称创建文件夹 成功返回路径, 失败返回nil
- (NSString*)createFolderAtName:(NSString *)folderName inDirectory:(XNAppInfoDirectoryType)directoryType;

#pragma mark - 通过文件名获取文件路径
- (NSString*)filePathForName:(NSString *)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType;

#pragma mark - 判断文件是否存在
- (BOOL)fileExistsForName:(NSString *)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType;

#pragma mark - 读写文件 (结果为 NSMutableDictionary* 或 NSMutableArray*)
- (NSMutableDictionary*)readDictForFile:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType;
- (NSMutableArray*)readArrayForFile:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType;

- (BOOL)writeDictToFile:(NSDictionary*)dict fileName:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType;
- (BOOL)writeArrayToFile:(NSArray*)array fileName:(NSString*)fileName andSuffix:(NSString*)suffix inDirectory:(XNAppInfoDirectoryType)directoryType;

#pragma mark - 读写plist文件 (结果为 NSMutableDictionary* 或 NSMutableArray*)
- (NSMutableDictionary*)readDictForPlistFile:(NSString*)fileName inDirectory:(XNAppInfoDirectoryType)directoryType;
- (NSMutableArray*)readArrayForPlistFile:(NSString*)fileName inDirectory:(XNAppInfoDirectoryType)directoryType;

- (BOOL)writeDictToPlistFile:(NSDictionary*)dict fileName:(NSString*)fileName inDirectory:(XNAppInfoDirectoryType)directoryType;
- (BOOL)writeArrayToPlistFile:(NSArray*)array fileName:(NSString*)fileName inDirectory:(XNAppInfoDirectoryType)directoryType;
@end
