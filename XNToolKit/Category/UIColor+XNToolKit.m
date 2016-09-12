//
//  UIColor+XNToolKit.m
//  XNToolKit
//
//  Created by Jiabao on 16/8/17.
//  Copyright © 2016年 XNToolKit. All rights reserved.
//

#import "UIColor+XNToolKit.h"

@implementation UIColor (XNToolKit)

+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    return [self colorWithRGBHex:hex andAlpha:1.0f];
}

+ (UIColor *)colorWithRGBHex:(UInt32)hex andAlpha:(CGFloat)alpha {
    unsigned int r = (hex >> 16) & 0xFF;
    unsigned int g = (hex >> 8) & 0xFF;
    unsigned int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    return [self colorWithHexString:hexString andAlpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(CGFloat)alpha {
    UIColor *color = nil;
    
    NSString *colorStr = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if (6 <= colorStr.length) {
        
        // strip 0X if it appears
        if ([colorStr hasPrefix:@"0X"])
            colorStr = [colorStr substringFromIndex:2];
        if ([colorStr hasPrefix:@"#"])
            colorStr = [colorStr substringFromIndex:1];
        if (6 == colorStr.length) {
            // Separate into r, g, b substrings
            NSRange range;
            range.length = 2;
            
            //r
            range.location = 0;
            NSString *rString = [colorStr substringWithRange:range];
            
            //g
            range.location = 2;
            NSString *gString = [colorStr substringWithRange:range];
            
            //b
            range.location = 4;
            NSString *bString = [colorStr substringWithRange:range];
            
            // Scan values
            unsigned int r, g, b;
            [[NSScanner scannerWithString:rString] scanHexInt:&r];
            [[NSScanner scannerWithString:gString] scanHexInt:&g];
            [[NSScanner scannerWithString:bString] scanHexInt:&b];
            
            color = [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
        }
    }
    return color;
}

@end
