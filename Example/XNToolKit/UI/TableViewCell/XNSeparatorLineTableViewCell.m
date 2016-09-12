//
//  XNSeparatorLineTableViewCell.m
//  XNToolKit
//
//  Created by Jiabao on 16/8/25.
//  Copyright © 2016年 XNToolKit. All rights reserved.
//

#import "XNSeparatorLineTableViewCell.h"

@interface XNSeparatorLineTableViewCell () {
    BOOL _isFirstDisplay;
}

@end

@implementation XNSeparatorLineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (nil != self) {
        [self initializeValue];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initializeValue];
}

- (void)initializeValue {    
    UIColor *color = [UIColor colorWithRed:(221.0f / 255.0f)
                                     green:(221.0f / 255.0f)
                                      blue:(221.0f / 255.0f)
                                     alpha:1.0f];
    
    _isFirstDisplay = YES;
    _topSeparatorLineHeight = 0.5f;
    _bottomSeparatorLineHeight = 0.5f;
    _topSeparatorLineColor = [color copy];
    _bottomSeparatorLineColor = [color copy];
}

#pragma mark - 立即更新
- (void)immediatelyUpdateDisplaySeparatorLine {
    _defersUpdateDisplaySeparatorLine = NO;
    [self setNeedsDisplay];
}

#pragma mark - 顶部分隔线
- (void)setTopSeparatorLineColor:(UIColor *)topSeparatorLineColor {
    if ([topSeparatorLineColor isEqual:_topSeparatorLineColor]) {
        return;
    }
    _topSeparatorLineColor = topSeparatorLineColor;
    [self updateTopSeparatorLine:NO];
}

- (void)setTopSeparatorLineHidden:(BOOL)topSeparatorLineHidden {
    if (topSeparatorLineHidden == _topSeparatorLineHidden) {
        return;
    }
    _topSeparatorLineHidden = topSeparatorLineHidden;
    [self updateTopSeparatorLine:YES];
}

- (void)setTopSeparatorLineHeight:(CGFloat)topSeparatorLineHeight {
    if (topSeparatorLineHeight == _topSeparatorLineHeight) {
        return;
    }
    _topSeparatorLineHeight = topSeparatorLineHeight;
    [self updateTopSeparatorLine:NO];
}

- (void)setTopSeparatorLineLeftSpace:(CGFloat)topSeparatorLineLeftSpace {
    if (topSeparatorLineLeftSpace == _topSeparatorLineLeftSpace) {
        return;
    }
    _topSeparatorLineLeftSpace = topSeparatorLineLeftSpace;
    [self updateTopSeparatorLine:NO];
}

- (void)setTopSeparatorLineRightSpace:(CGFloat)topSeparatorLineRightSpace {
    if (topSeparatorLineRightSpace == _topSeparatorLineRightSpace) {
        return;
    }
    _topSeparatorLineRightSpace = topSeparatorLineRightSpace;
    [self updateTopSeparatorLine:NO];
}

- (void)updateTopSeparatorLine:(BOOL)isHiddenOperation {
    
    // 如果延迟刷新或者是第一次显示, 则暂时不更新页面
    if (_defersUpdateDisplaySeparatorLine || _isFirstDisplay) {
        return;
    }
    // 如果是隐藏的操作或者分隔线处于显示状态, 才会更新
    if (isHiddenOperation || !_topSeparatorLineHidden) {
        [self setNeedsDisplay];
    }
}

#pragma mark - 底部分隔线
- (void)setBottomSeparatorLineColor:(UIColor *)bottomSeparatorLineColor {
    if ([bottomSeparatorLineColor isEqual:_bottomSeparatorLineColor]) {
        return;
    }
    _bottomSeparatorLineColor = bottomSeparatorLineColor;
    [self updateBottomSeparatorLine:NO];
}

- (void)setBottomSeparatorLineHidden:(BOOL)bottomSeparatorLineHidden {
    if (bottomSeparatorLineHidden == _bottomSeparatorLineHidden) {
        return;
    }
    _bottomSeparatorLineHidden = bottomSeparatorLineHidden;
    [self updateBottomSeparatorLine:YES];
}

- (void)setBottomSeparatorLineHeight:(CGFloat)bottomSeparatorLineHeight {
    if (bottomSeparatorLineHeight == _bottomSeparatorLineHeight) {
        return;
    }
    _bottomSeparatorLineHeight = bottomSeparatorLineHeight;
    [self updateBottomSeparatorLine:NO];
}

- (void)setBottomSeparatorLineLeftSpace:(CGFloat)bottomSeparatorLineLeftSpace {
    if (bottomSeparatorLineLeftSpace == _bottomSeparatorLineLeftSpace) {
        return;
    }
    _bottomSeparatorLineLeftSpace = bottomSeparatorLineLeftSpace;
    [self updateBottomSeparatorLine:NO];
}

- (void)setBottomSeparatorLineRightSpace:(CGFloat)bottomSeparatorLineRightSpace {
    if (bottomSeparatorLineRightSpace == _bottomSeparatorLineRightSpace) {
        return;
    }
    _bottomSeparatorLineRightSpace = bottomSeparatorLineRightSpace;
    [self updateBottomSeparatorLine:NO];
}

- (void)updateBottomSeparatorLine:(BOOL)isHiddenOperation {
    
    // 如果延迟刷新或者是第一次显示, 则暂时不更新页面
    if (_defersUpdateDisplaySeparatorLine || _isFirstDisplay) {
        return;
    }
    // 如果是隐藏的操作或者分隔线处于显示状态, 才会更新
    if (isHiddenOperation || !_bottomSeparatorLineHidden) {
        [self setNeedsDisplay];
    }
}

#pragma mark - 更新UI
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    // 已经显示, 以后再更改属性需要主动刷新
    _isFirstDisplay = NO;
    
    CGRect bound = self.bounds;
    
    if (!_topSeparatorLineHidden) {
        // 获得当前画布
        CGContextRef cxt = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(cxt, _topSeparatorLineHeight);
        CGContextSetStrokeColorWithColor(cxt, _topSeparatorLineColor.CGColor);
        CGContextMoveToPoint(cxt, _topSeparatorLineLeftSpace , _topSeparatorLineHeight/2);
        CGContextAddLineToPoint(cxt, bound.size.width - _topSeparatorLineRightSpace, _topSeparatorLineHeight/2);
        
        CGContextStrokePath(cxt);
    }
    
    if (!_bottomSeparatorLineHidden) {
        // 获得当前画布
        CGContextRef cxt = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(cxt, _bottomSeparatorLineHeight);
        CGContextSetStrokeColorWithColor(cxt, _bottomSeparatorLineColor.CGColor);
        CGContextMoveToPoint(cxt, _bottomSeparatorLineLeftSpace , bound.size.height - _bottomSeparatorLineHeight/2);
        CGContextAddLineToPoint(cxt, bound.size.width - _bottomSeparatorLineRightSpace, bound.size.height - _bottomSeparatorLineHeight/2);
        
        CGContextStrokePath(cxt);
    }
}

@end
