//
//  cvprocess.h
//  opencv_ios_01
//
//  Created by guoruiqing on 2017/3/12.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface cvprocess : NSObject

+(cv::Mat)cvMatFromUIImage:(UIImage *)image;
+(cv::Mat)cvMatGrayFromUIImage:(UIImage *)image;
+(UIImage *)UIImageFromCVMat:(cv::Mat)cvMat;

@end
