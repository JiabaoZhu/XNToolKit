//
//  NSURL+XNToolKit.h
//  XNToolKit
//
//  Created by Jiabao on 16/8/17.
//  Copyright © 2016年 XNToolKit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (XNToolKit)

// 应用有一些文件需要永久的存储在本地使应用支持离线功能, 但是这些文件并不包含用户数据, 无需备份, 调用下面这个方法可以防止文件被备份
// http://blog.csdn.net/u012143998/article/details/52228143
- (BOOL)addSkipBackupAttribute;

@end
