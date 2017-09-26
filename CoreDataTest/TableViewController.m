//
//  TableViewController.m
//  CoreDataTest
//
//  Created by IN1947 on 02/09/17.
//  Copyright © 2017 IN1947. All rights reserved.
//

#import "TableViewController.h"
#import "SharedClass.h"
#import "UpdateContactController.h"

@interface TableViewController (){
  
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[SharedClass sharedInstance]fetchDataFromDB];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[SharedClass sharedInstance]data].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    self.obj=[[[SharedClass sharedInstance]data] objectAtIndex:indexPath.row];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.font=[UIFont systemFontOfSize:25];
    cell.textLabel.text=[self.obj valueForKey:@"name"];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        self.obj=[[[SharedClass sharedInstance]data] objectAtIndex:indexPath.row];
        [[SharedClass sharedInstance]deleteContactFromDB:self.obj];
        [[[SharedClass sharedInstance]data] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
       
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UpdateContactController * UP = [self.storyboard instantiateViewControllerWithIdentifier:@"Update"];
    UP.obj = [[NSArray alloc]init];
    UP.obj = [[NSArray alloc]initWithObjects:[[[SharedClass sharedInstance]data] objectAtIndex:indexPath.row], nil];
    [self.navigationController pushViewController:UP animated:YES];
}
#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
