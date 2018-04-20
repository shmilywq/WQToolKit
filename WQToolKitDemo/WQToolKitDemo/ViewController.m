//
//  ViewController.m
//  WQToolKitDemo
//
//  Created by shmily on 2017/9/25.
//  Copyright © 2017年 shmily. All rights reserved.
//

#import "ViewController.h"
#import "WQToolKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - Action

- (IBAction)clickCameraAction:(id)sender {
    WQSingleImgPicker *imgPicker = [[WQSingleImgPicker alloc] init];
    [imgPicker selectPhotoWithFromController:self sourceType:(UIImagePickerControllerSourceTypeCamera) allowEdit:NO selected:^(UIImage *image) {
        
    } cancel:^{
        
    }];
}
- (IBAction)clickPhotoAlbumAction:(id)sender {
    WQSingleImgPicker *imgPicker = [[WQSingleImgPicker alloc] init];
    [imgPicker selectPhotoWithFromController:self sourceType:(UIImagePickerControllerSourceTypeSavedPhotosAlbum) allowEdit:NO selected:^(UIImage *image) {
        
    } cancel:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
