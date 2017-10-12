//
//  WQSingleImgPicker.m
//  xiaomayizhan
//
//  Created by shmily on 2017/9/21.
//  Copyright © 2017年 xuli. All rights reserved.
//

#import "WQSingleImgPicker.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <WQAlert/WQAlert.h>

@interface WQSingleImgPicker () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, copy) WQPhotoSelectedBlock selectedBlock;
@property (nonatomic, copy) WQPhotoCancelBlock cancelBlock;
@property (nonatomic, weak) UIViewController *fromController;
@property (nonatomic, assign) BOOL isAllowEdit;

@end

@implementation WQSingleImgPicker

- (void)selectPhotoWithFromController:(UIViewController *)fromController sourceType:(UIImagePickerControllerSourceType)sourceTree allowEdit:(BOOL)isAllowEdit selected:(WQPhotoSelectedBlock)selectedBlock cancel:(WQPhotoCancelBlock)cancelBlock
{
    self.selectedBlock = [selectedBlock copy];
    self.cancelBlock = [cancelBlock copy];
    self.fromController = fromController;
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceTree]) {
        if (sourceTree == UIImagePickerControllerSourceTypeCamera) {
            // 检测用户是否打开了相机权限
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (authStatus == AVAuthorizationStatusDenied)
            {
                // 用户关闭了相机权限
                NSString *noCameraMsg = @"此应用程序没有权限访问您的相机，您可以点击“设置”启用访问相机权限";
                if (self.noCameraJurisMsg) {
                    noCameraMsg = self.noCameraJurisMsg;
                }
                [WQAlertView showSystemAlertViewWithFromVC:fromController title:nil message:noCameraMsg cancelBtnTitle:@"取消" cancelActionBlock:nil confirmBtnTitle:@"设置" confirmActionBlock:^{
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                }];
                return;
            }
        } else if (sourceTree == UIImagePickerControllerSourceTypeSavedPhotosAlbum) {
            ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
            if (author ==ALAuthorizationStatusDenied || author == ALAuthorizationStatusRestricted){
                // 用户关闭了相册权限
                NSString *noAlbumMsg = @"此应用程序没有权限访问您的相册，您可以点击“设置”启用访问相册权限";
                if (self.noAlbumJurisMsg) {
                    noAlbumMsg = self.noAlbumJurisMsg;
                }
                [WQAlertView showSystemAlertViewWithFromVC:fromController title:nil message:noAlbumMsg cancelBtnTitle:@"取消" cancelActionBlock:nil confirmBtnTitle:@"设置" confirmActionBlock:^{
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                }];
                return;
            }
        }
        _isAllowEdit = isAllowEdit;
        [self choosePhotoWithSourceType:sourceTree];
    }
}
#pragma mark - 选择照片
- (void)choosePhotoWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = sourceType;
    imagePicker.allowsEditing = _isAllowEdit;
    [_fromController presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - 照片选择完成
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (_isAllowEdit) {
        image =[info objectForKey:UIImagePickerControllerEditedImage];
    }
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    }
    if (image && self.selectedBlock) {
        self.selectedBlock(image);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// 取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)aPicker {
    [aPicker dismissViewControllerAnimated:YES completion:nil];
    
    if (self.cancelBlock) {
        self.cancelBlock();
    }
    [aPicker dismissViewControllerAnimated:YES completion:nil];
}




@end
