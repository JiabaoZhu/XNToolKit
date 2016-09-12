//
//  UIImage+XNToolKit.h
//  XNToolKit
//
//  Created by Jiabao on 16/7/3.
//  Copyright © 2016年 XNToolKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XNToolKit)

#pragma mark - Color

/**
 *  根据颜色创建图片
 *
 *  @param UIImage 颜色
 *
 *  @return 生成的纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  获取图片中某一个像素的颜色
 *
 *  @param UIColor 图片中点的坐标
 *
 *  @return 该点的颜色
 */
- (UIColor *)colorAtPixel:(CGPoint)point;
- (UIColor *)colorAtPoint:(CGPoint)point;

/**
 *  将图片转为灰度图
 *
 *  @param UIImage
 *
 *  @return 灰度图片
 */
- (UIImage *)convertToGrayscale;


#pragma mark - SubView

/**
 *  将UIView转成UIImage
 *
 *  @param view 要截取的View
 *
 *  @return 截取的图像
 */
+ (UIImage *)imageWithView:(UIView *)view;
+ (UIImage *)imageFromView:(UIView *)view;

/**
 *  将UIView的指定区域转成UIImage
 *
 *  @param view 要截取的View
 *  @param rect 要截取的位置区域
 *
 *  @return 截取的图像
 */
+ (UIImage *)imageWithView:(UIView *)view atFrame:(CGRect)rect;
+ (UIImage *)imageFromView:(UIView *)view atFrame:(CGRect)rect;

@end
