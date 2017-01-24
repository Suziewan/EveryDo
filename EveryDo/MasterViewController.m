//
//  MasterViewController.m
//  EveryDo
//
//  Created by Angie Linton on 2017-01-24.
//  Copyright © 2017 Angie Linton. All rights reserved.
//


#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ListTableViewCell.h"

@interface MasterViewController ()

@property NSMutableArray *toDos;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 self.toDos = [NSMutableArray arrayWithCapacity:20];
    
    ToDo *todo = [[ToDo alloc]init];
    todo.title = @"Get dressed";
    todo.todoDescription = @"Choose appropriate clothing";
    todo.priorityNumber = 1;
    todo.isCompleteIndicator = NO;
    [_toDos addObject:todo];
    
    todo = [[ToDo alloc]init];
    todo.title = @"Feed Dogs";
    todo.todoDescription = @"Put kibble and yogurt in bowl";
    todo.priorityNumber = 2;
    todo.isCompleteIndicator = NO;
    [_toDos addObject:todo];
    
    todo = [[ToDo alloc]init];
    todo.title = @"Eat Breakfast";
    todo.todoDescription = @"Make a healthy choice";
    todo.priorityNumber = 3;
    todo.isCompleteIndicator = NO;
    [_toDos addObject:todo];
    
    todo = [[ToDo alloc]init];
    todo.title = @"Clean up";
    todo.todoDescription = @"Put dishes away and wipe the table";
    todo.priorityNumber = 4;
    todo.isCompleteIndicator = NO;
    [_toDos addObject:todo];
    
    todo = [[ToDo alloc]init];
    todo.title = @"Brush your teeth";
    todo.todoDescription = @"Get all the sides, top and bottom";
    todo.priorityNumber = 3;
    todo.isCompleteIndicator = NO;
    [_toDos addObject:todo];
    

}

- (void)insertNewObject:(id)sender {
    if (!self.toDos) {
        self.toDos = [[NSMutableArray alloc] init];
    }
    [self.toDos insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *cell =(ListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"defaultCell" forIndexPath:indexPath];
    ToDo *todo = self.toDos[indexPath.row];
    [cell.titleLabel setText:todo.title];


    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //detailviewcontroller is the destination
    
    DetailViewController *vc = [segue destinationViewController];
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    NSString *title = self.toDos[indexPath.row];
    
    vc.title = title;
}



@end
