//
//  UITextField+WQPlaceholderColor.m
//  xiaomayizhan
//
//  Created by ZS on 17/8/17.
//  Copyright © 2017年 xuli. All rights reserved.
//

#import "UITextField+WQPlaceholderColor.h"

@implementation UITextField (WQPlaceholderColor)

- (void)placeholderColor:(UIColor *)color
{
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

@end
