//
//  QPEdgeMenuController.h
//  EdgeMenuControllerDemo
//
//  Created by QiuPeng on 2017/3/17.
//  Copyright © 2017年 bmcciscoding. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QPEdgeMenuController;

@interface UIViewController (QPEdgeMenuController)

@property (nonatomic, strong, readonly) QPEdgeMenuController *edgeMenuController;

@end

@interface QPEdgeMenuController : UIViewController

- (instancetype)initWithMainVC:(UIViewController *)mainVC leftVC:(UIViewController *)leftVC;

@property (nonatomic, strong, readonly) UIViewController *leftVC;
@property (nonatomic, strong, readonly) UIViewController *mainVC;

@property (nonatomic, assign) CGFloat animationDuration;                         // 0.25;
@property (nonatomic, assign) CGFloat needShowLeftWidth;                        // 70 % screen width
@property (nonatomic, assign, readonly) BOOL isShowingLeft;

- (void)showLeftVC;
- (void)showMainVC;

@end
