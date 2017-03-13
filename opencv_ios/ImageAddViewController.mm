//
//  ImageAddViewController.m
//  opencv_ios
//
//  Created by guoruiqing on 2017/3/13.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "ImageAddViewController.h"
#import "cvprocess.h"

@interface ImageAddViewController ()

@end

@implementation ImageAddViewController

using namespace cv;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Mat src1 = [cvprocess cvMatFromUIImage:[UIImage imageNamed:@"001.png"]];
    Mat src2 = [cvprocess cvMatFromUIImage:[UIImage imageNamed:@"0001.png"]];
    
    double alpha = 0.7;
    double beta = 1 - alpha;
    Mat dst;
    addWeighted(src1, alpha, src2, beta, 0.0, dst);
    
    
    UIImage *image = [cvprocess UIImageFromCVMat:dst];
    UIImageView *imview = [[UIImageView alloc]initWithImage:image];
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
