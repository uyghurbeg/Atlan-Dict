//
//  BGTabbarController.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/26.
//  Copyright © 2015年 BG. All rights reserved.
//
#import "BGTabbarItem.h"
#import "BGTabbarController.h"
#import "BGSearchController.h"
#import "BGSavedController.h"
#import "BGInfoController.h"
#import "BGBiglistController.h"


@interface BGTabbarController ()

@end

@implementation BGTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self.tabBar removeFromSuperview];
//    
//    BGTabbarItem *tabbar = [[BGTabbarItem alloc] init];
//    
//    tabbar.frame = self.tabBar.frame;
//    
//    [self.view addSubview:tabbar];
    
    
    //create the first one
    BGInfoController *vc1 = [[BGInfoController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    nav1.title = @"ھەققىمىزدە";
    nav1.navigationBar.tintColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.9 alpha:1];
    nav1.tabBarItem.image = [UIImage imageNamed:@"setting_icon"];
    

    [self addChildViewController:nav1];

    
    //craate the third one
    BGSavedController *vc3 = [[BGSavedController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    nav3.title = @"خەتكۈچ";
    nav3.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -1);
    nav3.tabBarItem.image = [UIImage imageNamed:@"save"];
    [self addChildViewController:nav3];
    
    
    //create the second one
    BGSearchController *vc2 = [[BGSearchController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    nav2.title = @"ئىزدەش";
    nav2.navigationItem.title = @"ئىزدەش";
    nav2.tabBarItem.image = [UIImage imageNamed:@"search_icon"];
    [self addChildViewController:nav2];
    
    //create the forht one
    BGBiglistController *vc4 = [[BGBiglistController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    nav4.title = @"باشبەت";
    nav4.tabBarItem.image = [UIImage imageNamed:@"home_icon"];
    [self addChildViewController:nav4];
    
    
    // let the tabbar start from the right
    [self setSelectedIndex:3];


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
