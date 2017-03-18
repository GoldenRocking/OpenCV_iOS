//
//  DrawingViewController.m
//  opencv_ios
//
//  Created by guoruiqing on 2017/3/18.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "DrawingViewController.h"
#import "cvprocess.h"
#import "drawTool.hpp"

@interface DrawingViewController ()

@end

@implementation DrawingViewController
using namespace cv;




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    /// 创建空全黑像素的空图像
    Mat atom_image = Mat::zeros(w, w, CV_8UC3);
    Mat rook_image = Mat::zeros(w, w, CV_8UC3);
    
    /// 1. 画一个简单的原子。
    
    /// 1.a. 创建椭圆
    MyEllipse(atom_image, 90);
    MyEllipse(atom_image, 0);
    MyEllipse(atom_image, 45);
    MyEllipse(atom_image, -45);

    /// 1.b. 创建圆
    MyFilledCircle( atom_image, cv::Point( w/2.0, w/2.0) );
    
    UIImageView *img = [[UIImageView alloc]init];
    img.frame = CGRectMake(10, 0, w, w);
    [img setImage:[cvprocess UIImageFromCVMat:atom_image ]];
    
    [self.view addSubview:img];
    
    /// 2. 画一个赌棍
    
    /// 2.a. 创建一个凸多边形
    MyPolygon( rook_image );
    
    /// 2.b. 创建矩形
    rectangle( rook_image,
              cv::Point( 0, 7*w/8.0 ),
              cv::Point( w, w),
              Scalar( 0, 255, 255 ),
              -1,
              8 );
    
    /// 2.c. 画几条直线
    MyLine( rook_image, cv::Point( 0, 15*w/16 ), cv::Point( w, 15*w/16 ) );
    MyLine( rook_image, cv::Point( w/4, 7*w/8 ), cv::Point( w/4, w ) );
    MyLine( rook_image, cv::Point( w/2, 7*w/8 ), cv::Point( w/2, w ) );
    MyLine( rook_image, cv::Point( 3*w/4, 7*w/8 ), cv::Point( 3*w/4, w ) );
    
    UIImageView *img2 = [[UIImageView alloc]init];
    img2.frame = CGRectMake(10, 320, w, w);
    [img2 setImage:[cvprocess UIImageFromCVMat:rook_image ]];
    
    [self.view addSubview:img2];

    
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
