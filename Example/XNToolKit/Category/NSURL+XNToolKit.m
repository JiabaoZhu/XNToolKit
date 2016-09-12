//
//  NSURL+XNToolKit.m
//  XNToolKit
//
//  Created by Jiabao on 16/8/17.
//  Copyright © 2016年 XNToolKit. All rights reserved.
//

#import <sys/xattr.h>
#import <UIKit/UIKit.h>
#import "NSURL+XNToolKit.h"


#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


@implementation NSURL (XNToolKit)

- (BOOL)addSkipBackupAttribute {
    // 如果目录或文件存在
    if ([[NSFileManager defaultManager] fileExistsAtPath: [self path]]) {
        
        // 如果版本大于等于5.1
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.1")) {
            NSError *error = nil;
            BOOL success = [self setResourceValue: [NSNumber numberWithBool: YES] forKey: NSURLIsExcludedFromBackupKey error: &error];
            if(error) {
                NSLog(@"addSkipBackupAttributeToItemAtURL: %@, error: %@", [self lastPathComponent], error);
            }
            return success;
        }
        
        // 如果版本小于等于5.0
        if (SYSTEM_VERSION_GREATER_THAN(@"5.0")) {
            const char* filePath = [[self path] fileSystemRepresentation];
            const char* attrName = "com.apple.MobileBackup";
            u_int8_t attrValue = 1;
            int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
            return result == 0;
        }
    }
    return NO;
}

@end

