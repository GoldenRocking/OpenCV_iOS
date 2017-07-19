//
//  SmoothViewController.m
//  opencv_ios
//
//  Created by guoruiqing on 2017/3/20.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "SmoothViewController.h"
#import "cvprocess.h"

@interface SmoothViewController ()

@property(nonatomic,strong)UIImageView *imview;

@end

@implementation SmoothViewController
using namespace cv;

int MAX_KERNEL_LENGTH = 25;

cv::Mat src;
cv::Mat dst;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"原图",@"均值平滑",@"高斯平滑",@"中值平滑",@"双边平滑"]];
    segment.frame = CGRectMake(0, 10,300 , 30);
    segment.center = CGPointMake(self.view.frame.size.width/2, 20);
    segment.selectedSegmentIndex = 0;
    segment.tintColor = [UIColor orangeColor];
    [segment addTarget:self action:@selector(segmentValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    
    UIImage *baseImage =[UIImage imageNamed:@"001.png"];
    
    _imview = [[UIImageView alloc]initWithImage:baseImage];
    _imview.frame = CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height - 30);
    _imview.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imview];

}

-(void)segmentValue:(UISegmentedControl *)sender
{
    NSInteger tag = sender.selectedSegmentIndex;
    
    UIImage *baseImage =[UIImage imageNamed:@"001.png"];
    src = [cvprocess cvMatFromUIImage:baseImage];
    dst = cv::Mat::zeros(src.size(), src.type());

    UIImage *image;
    
    switch (tag) {
        case 0:
        {
            image = baseImage;
            
        }
            
            break;
        case 1:
        {
            //均值平滑
            for(int i = 1; i < MAX_KERNEL_LENGTH; i+=2)
            {
                cv::blur(src, dst, cv::Size(i,i),cv::Point(-1,-1));
            }
            
            image = [cvprocess UIImageFromCVMat:dst];
        }
            break;
            
        case 2:
        {
            // 使用高斯平滑
            for(int i = 1;i < MAX_KERNEL_LENGTH;i+=2)
            {
                //GaussianBlur(src, dst, cv::Size(i,i), 0,0);
                cv::GaussianBlur(src, dst, cv::Size(i,i), 0,0);
            }
            image = [cvprocess UIImageFromCVMat:dst];
            
        }
            break;
            
        case 3:
        {
            // 使用中值平滑
            for(int i = 1;i < MAX_KERNEL_LENGTH;i+=2)
            {
                //medianBlur(src, dst, i);
                cv::medianBlur(src, dst, i);
            }
            
           image = [cvprocess UIImageFromCVMat:dst];
           

        }
            break;
            
        case 4:
        {
            cv::Mat temp = cv::Mat::zeros(src.size(), CV_8UC3);
           
            cv::cvtColor(src, temp, cv::COLOR_BGRA2BGR);
            
            
            // 使用双边平滑
            for ( int i = 1; i < MAX_KERNEL_LENGTH; i+=2 )
            {
                cv::bilateralFilter(temp, dst, i, i*2, i/2 );
            }
            
        }
            break;
            
            
        default:
            break;
    }
    
    _imview.image = image;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
