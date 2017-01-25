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

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (nonatomic) NSMutableArray<ToDo*> *toDos;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 self.toDos = [NSMutableArray arrayWithCapacity:20];
    
    ToDo *todo = [[ToDo alloc]init];
    todo.title = @"Get dressed";
    todo.todoDescription = @"Choose appropriate clothing for the weather and your activities for the day.";
    todo.priority = @"1";
    todo.isComplete = NO;
    [_toDos addObject:todo];
    
    todo = [[ToDo alloc]init];
    todo.title = @"Feed Dogs";
    todo.todoDescription = @"Put the kibble and yogurt in their bowls; check to see if they need water.";
    todo.priority = @"2";
    todo.isComplete = NO;
    [_toDos addObject:todo];
    
    todo = [[ToDo alloc]init];
    todo.title = @"Eat Breakfast";
    todo.todoDescription = @"Make a healthy choice.  Did you include some fruit or protein?";
    todo.priority = @"3";
    todo.isComplete = NO;
    [_toDos addObject:todo];
    
    todo = [[ToDo alloc]init];
    todo.title = @"Clean up";
    todo.todoDescription = @"Put dishes away, in the dishwasher and wipe the table.";
    todo.priority = @"4";
    todo.isComplete = NO;
    [_toDos addObject:todo];
    
    todo = [[ToDo alloc]init];
    todo.title = @"Brush your teeth";
    todo.todoDescription = @"Get all the sides, top and bottom.  Don't forget to floss and rinse. ";
    todo.priority = @"5";
    todo.isComplete = NO;
    [_toDos addObject:todo];
    }



/*
- (IBAction)buttonTapped:(UIButton *)sender {
    
    if (self.doneButton == YES) {
        NSLog(@"%@", self.title);
    }
}
 */

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //refresh my tableview
    [self.tableView reloadData];
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
    
    // these 2 return the same object
    //ToDo *title = self.toDos[indexPath.row];
    //ToDo *description = self.toDos[indexPath.row];
    
    //as proof that these 2 items are the same:
    /*
    Printing description of description:
    <ToDo: 0x618000058d80>
    Printing description of title:
    <ToDo: 0x618000058d80>
    */
    
    ToDo *todoItem = self.toDos[indexPath.row];
    
    [cell.titleLabel setText:todoItem.title];
    
    
    if (!todoItem.isComplete) {
        //regular
        [cell.descriptionLabel setText:todoItem.todoDescription];
    } else {
        //strike through
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:todoItem.todoDescription];
        [attributeString addAttribute:NSStrikethroughStyleAttributeName
                                value:@2
                                range:NSMakeRange(0, [attributeString length])];
        [cell.descriptionLabel setAttributedText:attributeString];

    }

    
    //1
    
    
    //2
    // take description and turn it into attributedString that
    //Strikethrough style
    
    ToDo *priority = self.toDos[indexPath.row];
    [cell.priorityLabel setText:priority.priority];

    
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
    
    ToDo *todo = self.toDos[indexPath.row];
    
    vc.todo = todo;
}



@end
