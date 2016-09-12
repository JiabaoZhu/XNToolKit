//
//  XNSeparatorLineTableViewCell.h
//  XNToolKit
//
//  Created by Jiabao on 16/8/25.
//  Copyright © 2016年 XNToolKit. All rights reserved.
//

#import <UIKit/UIKit.h>

// 用这个Cell添加View时 要注意留部分间距给分隔线
@interface XNSeparatorLineTableViewCell : UITableViewCell

// 如果设为YES, 则推迟更新SeparatorLine UI
@property (nonatomic, assign) BOOL defersUpdateDisplaySeparatorLine;

// 立即刷新UI, 会将 defersUpdateDisplaySeparatorLine 设置为NO
- (void)immediatelyUpdateDisplaySeparatorLine;

#pragma mark - 顶部分隔线
@property (nonatomic, copy)   UIColor *topSeparatorLineColor;
@property (nonatomic, assign) BOOL topSeparatorLineHidden;
@property (nonatomic, assign) CGFloat topSeparatorLineHeight;
@property (nonatomic, assign) CGFloat topSeparatorLineLeftSpace;
@property (nonatomic, assign) CGFloat topSeparatorLineRightSpace;

#pragma mark - 底部分隔线
@property (nonatomic, copy)   UIColor *bottomSeparatorLineColor;
@property (nonatomic, assign) BOOL bottomSeparatorLineHidden;
@property (nonatomic, assign) CGFloat bottomSeparatorLineHeight;
@property (nonatomic, assign) CGFloat bottomSeparatorLineLeftSpace;
@property (nonatomic, assign) CGFloat bottomSeparatorLineRightSpace;

@end
