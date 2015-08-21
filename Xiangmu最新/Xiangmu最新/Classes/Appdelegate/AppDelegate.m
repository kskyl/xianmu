//
//  AppDelegate.m
//  xiangmu
//
//  Created by lanou3g on 15/8/19.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeTableViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
   HomeTableViewController *homeVC=[[HomeTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    UINavigationController *homeNC=[[UINavigationController alloc]initWithRootViewController:homeVC];
    homeNC.navigationBar.frame=CGRectMake(0, 22, self.window.frame.size.width, 44);
   //添加碎片
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"碎片" style:UIBarButtonItemStylePlain target:self action:@selector(didClickButton:)];
    homeVC.navigationItem.rightBarButtonItem=right;
    //添加返回按钮
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(didClickLeftButton:)];
     homeVC.navigationItem.leftBarButtonItem=left;
    self.window.rootViewController=homeNC;
    
    return YES;
}


-(void)didClickButton:(UIBarButtonItem *)send{
    
}

-(void)didClickLeftButton:(UIBarButtonItem *)send{
    
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
