//
//  CoreViewController.m
//  opencv_ios
//
//  Created by guoruiqing on 2017/3/13.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "CoreViewController.h"
#import "ImageAddViewController.h"
#import "DrawingViewController.h"
#import "TextViewController.h"

@interface CoreViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CoreViewController
{
  @private
    NSMutableArray *viewArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Core Function";
    [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];
    
    
    viewArray = [NSMutableArray arrayWithObjects:@"1.使用opencv对两幅图求和",@"2.基本绘图",@"3.绘制文字", nil];
    
    
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
            ImageAddViewController *viewC = [[ImageAddViewController alloc]init];
            [self.navigationController pushViewController:viewC animated:YES];
            
        }
            
            break;
            
        case 1:
        {
            DrawingViewController *viewD = [[DrawingViewController alloc]init];
            [self.navigationController pushViewController:viewD animated:YES];
            
            
        }
            
            break;
        case 2:
        {
            TextViewController *viewT = [[TextViewController alloc]init];
            [self.navigationController pushViewController:viewT animated:YES];
                       
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
