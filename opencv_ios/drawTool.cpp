//
//  drawTool.cpp
//  opencv_ios
//
//  Created by guoruiqing on 2017/3/18.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#include "drawTool.hpp"


void MyEllipse(Mat img,double angle)
{
    int thickness = 2;
    int lineType = 8;
    
    ellipse(img,
            cv::Point(w/2.0,w/2.0),
            cv::Size(w/4.0,w/16.0),
            angle,
            0,
            360,
            Scalar(255,0,0),
            thickness,
            lineType
            );
}

void MyFilledCircle(Mat img,cv::Point center)
{
    int thickness = -1;
    int lineType = 8;
    
    cv::circle( img,
               center,
               300/32.0,
               cv:: Scalar( 0, 0, 255 ),
               thickness,
               lineType );
}

void MyPolygon( Mat img )
{
    int lineType = 8;
    
    /** 创建一些点 */
    cv::Point rook_points[1][20];
    rook_points[0][0] = cv::Point( w/4.0, 7*w/8.0 );
    rook_points[0][1] = cv::Point( 3*w/4.0, 7*w/8.0 );
    rook_points[0][2] = cv::Point( 3*w/4.0, 13*w/16.0 );
    rook_points[0][3] = cv::Point( 11*w/16.0, 13*w/16.0 );
    rook_points[0][4] = cv::Point( 19*w/32.0, 3*w/8.0 );
    rook_points[0][5] = cv::Point( 3*w/4.0, 3*w/8.0 );
    rook_points[0][6] = cv::Point( 3*w/4.0, w/8.0 );
    rook_points[0][7] = cv::Point( 26*w/40.0, w/8.0 );
    rook_points[0][8] = cv::Point( 26*w/40.0, w/4.0 );
    rook_points[0][9] = cv::Point( 22*w/40.0, w/4.0 );
    rook_points[0][10] = cv::Point( 22*w/40.0, w/8.0 );
    rook_points[0][11] = cv::Point( 18*w/40.0, w/8.0 );
    rook_points[0][12] = cv::Point( 18*w/40.0, w/4.0 );
    rook_points[0][13] = cv::Point( 14*w/40.0, w/4.0 );
    rook_points[0][14] = cv::Point( 14*w/40.0, w/8.0 );
    rook_points[0][15] = cv::Point( w/4.0, w/8.0 );
    rook_points[0][16] = cv::Point( w/4.0, 3*w/8.0 );
    rook_points[0][17] = cv::Point( 13*w/32.0, 3*w/8.0 );
    rook_points[0][18] = cv::Point( 5*w/16.0, 13*w/16.0 );
    rook_points[0][19] = cv::Point( w/4.0, 13*w/16.0) ;
    
    const cv::Point* ppt[1] = { rook_points[0] };
    int npt[] = { 20 };
    
    fillPoly( img,
             ppt,
             npt,
             1,
             Scalar( 255, 255, 255 ),
             lineType );
}

void MyLine( Mat img, cv::Point start, cv::Point end )
{
    int thickness = 2;
    int lineType = 8;
    line( img,
         start,
         end,
         Scalar( 0, 0, 0 ),
         thickness,
         lineType );
}

