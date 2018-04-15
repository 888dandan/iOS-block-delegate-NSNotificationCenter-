//
//  ViewController.m
//  iOS 逆向传值
//
//  Created by 曹轩 on 2018/4/14.
//  Copyright © 2018年 曹轩. All rights reserved.
//

#import "ViewController.h"
#import "JHUploadImage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}
//代理
- (IBAction)deleagteClick:(id)sender {
    
    [JHUPLOAD_IMAGE showActionSheetInFatherViewController:self delegate:self];

}
// block
- (IBAction)blockClcik:(id)sender {
    __weak typeof(self) weakSelf=self;
    
    // 进入照相机类
    [JHUPLOAD_IMAGE BlockshowActionSheetInFatherViewController:self];
    
    // 回调
    JHUPLOAD_IMAGE.uploadIamgeBlock = ^(UIImage *edittedImage, UIImage *origiImage) {
      
        weakSelf.myImageView.image=edittedImage;
    };
    
}

// 通知
- (IBAction)NotificationClick:(id)sender {
    [JHUPLOAD_IMAGE NSNotificationShowActionSheetInFatherViewController:self];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CenteruploadImage:) name:@"CenteruploadImage" object:nil];
    

}

 -(void) CenteruploadImage:(NSNotification*)notification{
    UIImage *image=notification.object[@"image"];
     self.myImageView.image=image;
 }

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"JHUploadImagecenter" object:nil];
}

#pragma mark - JHUploadImageDelegate

-(void)uploadImageToServerWithImage:(UIImage *)image OriginImage:(UIImage *)originImage
{
    NSLog(@"%@\n%@",originImage,image);
    self.myImageView.image=image;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
