//
//  UIImage+XNToolKit.m
//  XNToolKit
//
//  Created by Jiabao on 16/7/3.
//  Copyright © 2016年 XNToolKit. All rights reserved.
//

#import "UIImage+XNToolKit.h"

typedef enum {
    PIXELS_ALPHA    = 0,
    PIXELS_BLUE     = 1,
    PIXELS_GREEN    = 2,
    PIXELS_RED      = 3
} PIXELS;

@implementation UIImage (XNToolKit)

#pragma mark - Color
/**
 *  根据颜色创建图片
 *
 *  @param UIImage 颜色
 *
 *  @return 生成的纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  获取图片中某一个像素的颜色
 *
 *  @param UIColor 图片中点的坐标
 *
 *  @return 该点的颜色
 */
- (UIColor *)colorAtPoint:(CGPoint)point {
    return [self colorAtPixel:point];
}
- (UIColor *)colorAtPixel:(CGPoint)point {
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point)) {
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = self.CGImage;
    NSUInteger width = self.size.width;
    NSUInteger height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

/**
 *  将图片转为灰度图
 *
 *  @param UIImage
 *
 *  @return 灰度图片
 */
- (UIImage *)convertToGrayscale {
    CGSize size = [self size];
    int width = size.width;
    int height = size.height;
    
    // the pixels will be painted to this array
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // paint the bitmap to our context which will fill in the pixels array
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [self CGImage]);
    
    for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            // convert to grayscale using recommended method: http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
            uint32_t gray = 0.3 * rgbaPixel[PIXELS_RED] + 0.59 * rgbaPixel[PIXELS_GREEN] + 0.11 * rgbaPixel[PIXELS_BLUE];
            
            // set the pixels to gray
            rgbaPixel[PIXELS_RED] = gray;
            rgbaPixel[PIXELS_GREEN] = gray;
            rgbaPixel[PIXELS_BLUE] = gray;
        }
    }
    
    // create a new CGImageRef from our context with the modified pixels
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    
    // make a new UIImage to return
    UIImage *resultUIImage = [UIImage imageWithCGImage:image];
    
    // we're done with image now too
    CGImageRelease(image);
    
    return resultUIImage;
}



#pragma mark - SubView

/**
 *  将UIView转成UIImage
 *
 *  @param view 要截取的View
 *
 *  @return 截取的图像
 */
+ (UIImage *)imageFromView:(UIView *)view {
    return [self imageWithView:view];
}
+ (UIImage *)imageWithView:(UIView *)view {
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  将UIView的指定区域转成UIImage
 *
 *  @param view 要截取的View
 *  @param rect 要截取的位置区域
 *
 *  @return 截取的图像
 */
+ (UIImage *)imageFromView:(UIView *)view atFrame:(CGRect)rect {
    return [self imageWithView:view atFrame:rect];
}
+ (UIImage *)imageWithView:(UIView *)view atFrame:(CGRect)rect {
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(rect);
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
