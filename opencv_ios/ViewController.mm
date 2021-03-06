//
//  ViewController.m
//  opencv_ios
//
//  Created by guoruiqing on 2017/3/13.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "ViewController.h"
#import "IOSLinkViewController.h"
#import "CoreViewController.h"
#import "ProcessViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController
{
  @private
    NSMutableArray *viewArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setTranslucent:NO];
    self.title = @"OpenCV Learn";
    [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];
    
    viewArray = [NSMutableArray arrayWithObjects:@"1.在ios平台的调用",@"2.core模块，核心功能",@"3.图像处理", nil];
   
    
    UITableView *tableView=[[UITableView alloc]init];
    
    [tableView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    tableView.dataSource=self;
    tableView.delegate=self;
    [self.view addSubview:tableView];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellName=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    cell.textLabel.textColor=[UIColor blackColor];
    
    cell.textLabel.text=[NSString stringWithString:[viewArray objectAtIndex:indexPath.row]];
    return cell;
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [viewArray  count];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    switch (indexPath.row)
    {
        case 0:
            {
            
               IOSLinkViewController *viewC = [[IOSLinkViewController alloc]init];
               [self.navigationController pushViewController:viewC animated:YES];
               
             
            }
            
            break;
            
        case 1:
            {
            
                CoreViewController *viewC = [[CoreViewController alloc]init];
                [self.navigationController pushViewController:viewC animated:YES];
                [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            }
            
            break;
        case 2:
        {
            
            ProcessViewController *viewC = [[ProcessViewController alloc]init];
            [self.navigationController pushViewController:viewC animated:YES];
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
        }
            
            break;
            
        default:
            break;
        
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
