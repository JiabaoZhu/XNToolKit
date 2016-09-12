//
//  XNBaseNavigationController.m
//  XNToolKit
//
//  Created by Jiabao on 16/8/19.
//  Copyright © 2016年 XNToolKit. All rights reserved.
//

#import "XNBaseNavigationController.h"

@implementation XNBaseNavigationController

- (BOOL)shouldAutorotate{
    return [self.visibleViewController shouldAutorotate];
    
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (![self.visibleViewController isKindOfClass:[UIAlertController class]]) {
        //iOS9 UIWebRotatingAlertController
        return [self.visibleViewController supportedInterfaceOrientations];
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
}

@end
