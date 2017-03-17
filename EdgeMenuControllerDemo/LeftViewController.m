//
//  LeftViewController.m
//  EdgeMenuControllerDemo
//
//  Created by QiuPeng on 2017/3/17.
//  Copyright © 2017年 bmcciscoding. All rights reserved.
//

#import "LeftViewController.h"
#import "QPEdgeMenuController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBtn)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Right" style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBtn)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)clickLeftBtn {
    
    if (self.edgeMenuController.isShowingLeft) {
        [self.edgeMenuController showMainVC];
    }
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.hidesBottomBarWhenPushed = YES;
    UITabBarController *tabC = (UITabBarController *)self.edgeMenuController.mainVC;
    UINavigationController *navC = tabC.viewControllers.firstObject;
    [navC pushViewController:vc animated:YES];
     
}

- (void)clickRightBtn {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
