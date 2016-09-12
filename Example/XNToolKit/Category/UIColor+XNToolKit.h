//
//  UIColor+XNToolKit.h
//  XNToolKit
//
//  Created by Jiabao on 16/8/17.
//  Copyright © 2016年 XNToolKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XNToolKit)

+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)colorWithRGBHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(CGFloat)alpha;

@end


#pragma mark - 定义COLOR_RGBA
#define COLOR_RGBA(redValue, greenValue, blueValue, alphaValue)     \
    [UIColor colorWithRed:(redValue / 255.0f)                       \
                    green:(greenValue / 255.0f)                     \
                     blue:(blueValue / 255.0f)                      \
                    alpha:alphaValue]
#define COLOR_RGBA_HEX(rgbHex, alphaValue)                          \
    [UIColor colorWithRGBHex:rgbHex                                 \
                    andAlpha:alphaValue]

#pragma mark - 定义COLOR_RGB
#define COLOR_RGB(redValue, greenValue, blueValue) COLOR_RGBA(redValue, greenValue, blueValue, 1.0)
#define COLOR_RGB_HEX(rgbHex) COLOR_RGBA_HEX(rgbHex, 1.0)

#pragma mark - 定义RGB
#define RGB(redValue, greenValue, blueValue) COLOR_RGB(redValue, greenValue, blueValue)
#define RGB_HEX(rgbHex) COLOR_RGB_HEX(rgbHex)

#pragma mark - 定义RGBA
#define RGBA(redValue, greenValue, blueValue, alphaValue) COLOR_RGBA(redValue, greenValue, blueValue, alphaValue)
#define RGBA_HEX(rgbHex, alphaValue) COLOR_RGBA_HEX(rgbHex, alphaValue)

#pragma mark - 系统颜色
#define COLOR_S_WHITE       [UIColor whiteColor]
#define COLOR_S_BLACK       [UIColor blackColor]
#define COLOR_S_RED         [UIColor redColor]
#define COLOR_S_GREEN       [UIColor greenColor]
#define COLOR_S_BLUE        [UIColor blueColor]
#define COLOR_S_CYAN        [UIColor cyanColor]
#define COLOR_S_YELLOW      [UIColor yellowColor]
#define COLOR_S_ORANGE      [UIColor orangeColor]
#define COLOR_S_LIGHTGRAY   [UIColor lightGrayColor]
#define COLOR_S_DRAKGRAY    [UIColor darkGrayColor]
#define COLOR_S_GRAY        [UIColor grayColor]
#define COLOR_S_BROWN       [UIColor brownColor]
#define COLOR_S_CLEAR       [UIColor clearColor]


