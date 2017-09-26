//
//  UpdateContactController.m
//  CoreDataTest
//
//  Created by IN1947 on 02/09/17.
//  Copyright © 2017 IN1947. All rights reserved.
//

#import "UpdateContactController.h"
#import "TableViewController.h"

@interface UpdateContactController (){
    UINavigationBar *myNav;
}

@end

@implementation UpdateContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateNameToDatabase:(id)sender {
    [[SharedClass sharedInstance]updateContactToDB:self.nameTF.text :[self.obj objectAtIndex:0]];
    TableViewController * TC = [self.storyboard instantiateViewControllerWithIdentifier:@"Table"];
    [self.navigationController pushViewController:TC animated:YES];
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
