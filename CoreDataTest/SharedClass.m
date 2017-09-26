//
//  SharedClass.m
//  CoreDataTest
//
//  Created by IN1947 on 02/09/17.
//  Copyright © 2017 IN1947. All rights reserved.
//

#import "SharedClass.h"

@implementation SharedClass

static SharedClass * sharedObj=nil;

+(SharedClass *)sharedInstance{
    if (sharedObj==nil) {
        sharedObj =[[super allocWithZone:NULL]init];
    }
    return sharedObj;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return sharedObj;
}

-(id)init{
    self=[super init];
    AD = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.context = [AD.persistentContainer viewContext];
    if (self) {
        
    }
    return self;
}


-(void)addContactToDB:(NSString *)name{
    NSManagedObject * obj = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:self.context];
    [obj setValue:name forKey:@"name"];
    NSError * error;
    if (error) {
        NSLog(@"%@",error);
    }else{
        [self.context save:nil];
    }
}

-(void)fetchDataFromDB{
    NSFetchRequest * fetch = [[NSFetchRequest alloc]initWithEntityName:@"Contact"];
    NSError * error;
    NSArray * arr = [self.context executeFetchRequest:fetch error:&error];
    self.data=[[NSMutableArray alloc]init];
    for (int i=0; i<arr.count; i++) {
         self.obj = [arr objectAtIndex:i];
        [self.data addObject:self.obj];
    }
}

-(void)deleteContactFromDB:(NSManagedObject *)obj{
    [self.context deleteObject:obj];
    [self.context save:nil];
}



-(void)updateContactToDB:(NSString *)name :(NSManagedObject *)obj{
    [obj setValue:name forKey:@"name"];
    [self.context save:nil];
}


@end
