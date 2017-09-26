//
//  SharedClass.h
//  CoreDataTest
//
//  Created by IN1947 on 02/09/17.
//  Copyright © 2017 IN1947. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface SharedClass : NSObject{
    AppDelegate * AD;
}
@property NSManagedObject * obj;
@property NSManagedObjectContext * context;
@property NSMutableArray * data;

+(SharedClass *)sharedInstance;
-(void)addContactToDB:(NSString *)name;
-(void)updateContactToDB:(NSString *)name :(NSManagedObject *)obj;
-(void)fetchDataFromDB;
-(void)deleteContactFromDB:(NSManagedObject *)obj;

@end
