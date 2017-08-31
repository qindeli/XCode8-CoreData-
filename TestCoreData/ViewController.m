//
//  ViewController.m
//  TestCoreData
//
//  Created by vera on 2017/8/31.
//  Copyright © 2017年 deli. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Student+CoreDataClass.h"
#import "Student+CoreDataProperties.h"

@interface ViewController ()

@end

@implementation ViewController

//查询
- (void)query
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = app.persistentContainer.viewContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    
    request.entity = entityDescription;
    
    NSArray *fetchedObjects = [context executeFetchRequest:request error:nil];
    
    for (Student *s in fetchedObjects)
    {
        NSLog(@"%@ - %d",s.name, s.age);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self add];
    
    [self query];
    
}

//添加数据
- (void)add
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = app.persistentContainer.viewContext;
    
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
    [student setValue:@"小话" forKey:@"name"];
    [student setValue:@(20) forKey:@"age"];
    
    [app saveContext];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
