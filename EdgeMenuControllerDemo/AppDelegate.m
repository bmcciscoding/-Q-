//
//  AppDelegate.m
//  EdgeMenuControllerDemo
//
//  Created by QiuPeng on 2017/3/17.
//  Copyright © 2017年 bmcciscoding. All rights reserved.
//

#import "AppDelegate.h"

#import "QPEdgeMenuController.h"
#import "LeftViewController.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    leftVC.title = @"LeftVC";
    UINavigationController *nac = [[UINavigationController alloc] initWithRootViewController:leftVC];
    
    UITabBarController *tabC = [[UITabBarController alloc] init];
    MainViewController *mainVC = [[MainViewController alloc] init];
    UINavigationController *nac2 = [[UINavigationController alloc] initWithRootViewController:mainVC];
    mainVC.title = @"mainVC";
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.title = @"vc2";
    vc2.view.backgroundColor = [UIColor greenColor];
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.title = @"vc3";
    vc3.view.backgroundColor = [UIColor blueColor];
    
    [tabC addChildViewController:nac2];
    [tabC addChildViewController:vc2];
    [tabC addChildViewController:vc3];
    
    QPEdgeMenuController *edgeMenuController = [[QPEdgeMenuController alloc] initWithMainVC:tabC leftVC:nac];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = edgeMenuController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
