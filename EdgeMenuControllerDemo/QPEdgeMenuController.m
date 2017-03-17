//
//  QPEdgeMenuController.m
//  EdgeMenuControllerDemo
//
//  Created by QiuPeng on 2017/3/17.
//  Copyright © 2017年 bmcciscoding. All rights reserved.
//

#import "QPEdgeMenuController.h"

#import "UIView+YYAdd.h"
#import <objc/runtime.h>

@implementation UIViewController (QPEdgeMenuController)

- (QPEdgeMenuController *)edgeMenuController {
    UIViewController *parentVC = self.parentViewController;
    while (parentVC) {
        if ([parentVC isKindOfClass:[QPEdgeMenuController class]]) {
            return (QPEdgeMenuController *)parentVC;
        }
        else if (parentVC.parentViewController) {
            parentVC = parentVC.parentViewController;
        }
        else {
            parentVC = nil;
        }
    }
    return nil;
}

@end

@interface QPEdgeMenuController () <UIGestureRecognizerDelegate>

@end

@implementation QPEdgeMenuController

- (instancetype)initWithMainVC:(UIViewController *)mainVC leftVC:(UIViewController *)leftVC {
    if (self = [super init]) {
        _mainVC = mainVC;
        _leftVC = leftVC;
        
        _animationDuration = 0.25;
        _needShowLeftWidth = SCREEN_WIDTH * 0.7;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    // add sub view controller
    if (self.leftVC) {
        [self addChildViewController:self.leftVC];
        self.leftVC.view.width = self.needShowLeftWidth;
        self.leftVC.view.right = 0;
        [self.view addSubview:self.leftVC.view];
        self.leftVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.leftVC didMoveToParentViewController:self];
    }
    
    if (self.mainVC) {
        [self addChildViewController:self.mainVC];
        [self.view addSubview:self.mainVC.view];
        self.mainVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.mainVC didMoveToParentViewController:self];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanView:)];
        pan.delegate = self;
        [self.mainVC.view addGestureRecognizer:pan];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)pan {
    CGPoint v = [pan velocityInView:self.mainVC.view];
    if (v.x < 0 && self.isShowingLeft == NO) {
        return NO;
    }
    return YES;
}

#pragma mark - 

- (void)handlePanView:(UIPanGestureRecognizer *)pan {
    CGPoint point = [pan translationInView:self.mainVC.view];
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            self.mainVC.view.left += point.x;
            self.leftVC.view.right += point.x;
            [pan setTranslation:CGPointZero inView:self.mainVC.view];
            
            if (self.leftVC.view.right > self.needShowLeftWidth) {
                self.leftVC.view.right = self.needShowLeftWidth;
                self.mainVC.view.left = self.leftVC.view.right;
            }
            if (self.mainVC.view.right < SCREEN_WIDTH) {
                self.mainVC.view.right = SCREEN_WIDTH;
            }
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (self.mainVC.view.left > self.needShowLeftWidth * 0.5) {
                [self showLeftVC];
                return;
            }
            else {
                [self showMainVC];
            }
        }
            break;
        default:
            break;
    }
}

#pragma mark - 

- (void)showLeftVC {
    if (_isShowingLeft) {
        return;
    }

    self.leftVC.view.width = self.needShowLeftWidth;
    [UIView animateWithDuration:self.animationDuration animations:^{
        self.leftVC.view.left = 0;
        self.mainVC.view.left = self.leftVC.view.right;
    } completion:^(BOOL finished) {
        _isShowingLeft = YES;
    }];
}

- (void)showMainVC {    
    [UIView animateWithDuration:self.animationDuration animations:^{
        self.leftVC.view.right = 0;
        self.mainVC.view.left = 0;
    } completion:^(BOOL finished) {
        _isShowingLeft = NO;
    }];
}


@end
