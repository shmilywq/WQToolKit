//
//  WQSingleImgPicker.h
//  xiaomayizhan
//
//  Created by shmily on 2017/9/21.
//  Copyright © 2017年 xuli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WQSingleImgPicker : NSObject
/**
 *  选择后回调
 *
 *  @param image 选择的照片
 */
typedef void(^WQPhotoSelectedBlock)(UIImage *image);
/**
 *  取消选择的回调
 */
typedef void(^WQPhotoCancelBlock)(void);

/**
 * 没有相机权限的提醒文字,default:@"此应用程序没有权限访问您的相机，您可以点击“设置”启用访问相机权限"
 */
@property (nonatomic, copy) NSString *noCameraJurisMsg;
/**
 * 没有相册权限的提醒文字,default:@"此应用程序没有权限访问您的相册，您可以点击“设置”启用访问相册权限"
 */
@property (nonatomic, copy) NSString *noAlbumJurisMsg;

/**
 获取照片
 
 @param fromController 跳转的控制器
 @param sourceTree     选择的Type
 @param isAllowEdit    是否允许Edit
 @param selectedBlock  选择照片后的回调
 @param cancelBlock    取消的回调
 */

- (void)selectPhotoWithFromController:(UIViewController *)fromController
                           sourceType:(UIImagePickerControllerSourceType)sourceTree
                            allowEdit:(BOOL)isAllowEdit
                             selected:(WQPhotoSelectedBlock)selectedBlock
                               cancel:(WQPhotoCancelBlock)cancelBlock;

@end
