//
//  AddConactController.h
//  CoreDataTest
//
//  Created by IN1947 on 02/09/17.
//  Copyright © 2017 IN1947. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedClass.h"
@interface AddConactController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *nameTF;
- (IBAction)saveNameToDatabase:(id)sender;


@end
