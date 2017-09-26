//
//  TableViewController.h
//  CoreDataTest
//
//  Created by IN1947 on 02/09/17.
//  Copyright © 2017 IN1947. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property NSManagedObject * obj;

@end
