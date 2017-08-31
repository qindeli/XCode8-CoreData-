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

@property (nonatomic, strong) AppDelegate *appDelegate;

@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation ViewController

//查询
- (void)query
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:_context];
    request.entity = entityDescription;
    
    NSArray *fetchedObjects = [_context executeFetchRequest:request error:nil];
    
    for (Student *s in fetchedObjects)
    {
        NSLog(@"%@ - %d",s.name, s.age);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    _context = _appDelegate.persistentContainer.viewContext;

    
    //[self add];
    
    [self query];
    
}

//添加数据
- (void)add
{
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:_context];
    [student setValue:@"小话" forKey:@"name"];
    [student setValue:@(20) forKey:@"age"];
    
    [_appDelegate saveContext];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
