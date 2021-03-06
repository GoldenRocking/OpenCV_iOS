//
//  drawTool.hpp
//  opencv_ios
//
//  Created by guoruiqing on 2017/3/18.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#ifndef drawTool_hpp
#define drawTool_hpp

#include <stdio.h>
using namespace cv;
void MyEllipse(Mat img,double angle,int w);
void MyFilledCircle(Mat img,cv::Point center);
void MyPolygon( Mat img,int w);
void MyLine( Mat img, cv::Point start, cv::Point end );

#endif /* drawTool_hpp */
