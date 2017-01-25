//
//  DetailViewController.m
//  EveryDo
//
//  Created by Angie Linton on 2017-01-24.
//  Copyright © 2017 Angie Linton. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDo.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation DetailViewController

- (IBAction)buttonTouched:(UIButton *)sender {
    //get the object we are interested in
    //get the property
    self.todo.isComplete = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.titleLabel.text = self.todo.title;
    // same desc
    self.descriptionLabel.text = self.todo.todoDescription;
}


@end
