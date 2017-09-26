//
//  AppDelegate.h
//  CoreDataTest
//
//  Created by IN1947 on 02/09/17.
//  Copyright © 2017 IN1947. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

