//
//  UIButton+WQCustom.h
//  WQToolKitDemo
//
//  Created by shmily on 2017/10/12.
//  Copyright © 2017年 shmily. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    WQButtonEdgeInsetsStyleTop, // image在上，label在下
    WQButtonEdgeInsetsStyleLeft, // image在左，label在右
    WQButtonEdgeInsetsStyleBottom, // image在下，label在上
    WQButtonEdgeInsetsStyleRight // image在右，label在左
} WQButtonEdgeInsetsStyle;

@interface UIButton (WQCustom)


/**
 交换图片和按钮位置
 */

/**
 调整按钮上图片和文字的位置
 
 @param style 调整样式
 @param space 文字和图片间距
 */
- (void)changeImageAndTitleFrameWithStyle:(WQButtonEdgeInsetsStyle)style space:(CGFloat)space;

@end
