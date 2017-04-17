//
//  ViewController.m
//  JQMenuPopView
//
//  Created by 韩俊强 on 2017/4/17.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import "ViewController.h"
#import "JQMenuPopView.h"

@interface ViewController ()<MenuPopDelegate>

@property (nonatomic, strong) JQMenuPopView *myMenuPopView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor =[UIColor colorWithRed:55.0/265.0 green:69/265.0 blue:93.0/265.0 alpha:1.0];
    self.title = @"Demo";
}

- (IBAction)showJQMenuPopViewAction:(UIButton *)sender
{
    //将弹出菜单视图添加到主视图
    _myMenuPopView = [[JQMenuPopView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [_myMenuPopView setMenuPopDelegate:self];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_myMenuPopView];
    [_myMenuPopView showMenu];
    
    /** 如果弹出视图不是在最前端显示,可以 */
    //[self.view bringSubviewToFront:_myMenuPopView];
    //如果弹出视图是在自定义UITabBarController封装的控制器,需要将 JQMenuPopView 添加在UITabBarController 子视图中
}

#pragma mark - MenuPopDelegate 

-(void)JQMenuPopView:(JQMenuPopView *)MenuPopView didSelectedMenuIndex:(NSInteger)selectedIndex{
    NSLog(@"->>didSelectedMenuIndex->>点击的是第%ld个按钮",selectedIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
