//
//  IOSLinkViewController.m
//  opencv_ios
//
//  Created by guoruiqing on 2017/3/13.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "IOSLinkViewController.h"
#import "cvprocess.h"

@interface IOSLinkViewController ()

@end

@implementation IOSLinkViewController
using namespace cv;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"调用";
    
    UIImage *image = [UIImage imageNamed:@"timg"];
    Mat mat = [cvprocess cvMatFromUIImage:image];
    Mat grayMat;
    cvtColor(mat, grayMat, CV_BGR2GRAY);
    
    UIImage *cvimage = [cvprocess UIImageFromCVMat:grayMat];
    UIImageView *imview = [[UIImageView alloc]initWithImage:cvimage];
    imview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:imview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
