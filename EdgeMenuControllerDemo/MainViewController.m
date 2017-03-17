//
//  MainViewController.m
//  EdgeMenuControllerDemo
//
//  Created by QiuPeng on 2017/3/17.
//  Copyright © 2017年 bmcciscoding. All rights reserved.
//

#import "MainViewController.h"

#import "QPEdgeMenuController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBtn)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanView:)];
//    [self.view addGestureRecognizer:pan];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickLeftBtn {
    if (self.edgeMenuController.isShowingLeft) {
        [self.edgeMenuController showMainVC];
    }
    else {
        [self.edgeMenuController showLeftVC];
    }
}

- (void)handlePanView:(UIPanGestureRecognizer *)pan {
    
    
}

@end
