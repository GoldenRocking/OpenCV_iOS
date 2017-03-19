//
//  TextViewController.m
//  opencv_ios
//
//  Created by guoruiqing on 2017/3/19.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "TextViewController.h"
#import "cvprocess.h"

@interface TextViewController ()

@end

@implementation TextViewController
using namespace cv;
const int w = 300;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    /// 创建空全黑像素的空图像
    Mat atom_image = Mat::zeros(w, w, CV_8UC3);
    
    cv::putText(atom_image, "Hello,World", cv::Point(10,30), CV_FONT_HERSHEY_PLAIN, 2, Scalar( 0, 255, 255 ));
    
    cv::putText(atom_image, "Hello,OpenCV", cv::Point(10,100), CV_FONT_HERSHEY_COMPLEX, 1, Scalar( 30, 80, 255 ));
    
    cv::putText(atom_image, "Hello,GRQ186", cv::Point(10,150), CV_FONT_HERSHEY_SCRIPT_SIMPLEX, 1, Scalar( 30, 80, 255 ));
    
    UIImageView *img = [[UIImageView alloc]init];
    img.frame = CGRectMake(30, 50, w, w);
    [img setImage:[cvprocess UIImageFromCVMat:atom_image ]];
    
    [self.view addSubview:img];

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
