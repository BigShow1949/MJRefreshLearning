//
//  AppDelegate.h
//  MJRefreshLearning
//
//  Created by 杨帆 on 2018/3/26.
//  Copyright © 2018年 MJRefreshLearning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

