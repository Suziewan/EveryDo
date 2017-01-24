//
//  ListTableViewCell.h
//  EveryDo
//
//  Created by Angie Linton on 2017-01-24.
//  Copyright © 2017 Angie Linton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@end
//Create a custom UITableViewCell subclass that displays the title,
//a one-line preview of the task description,
//the priority level,
//and strikethrough text of all other text if the task is completed. This will require you to implement the delegate and data source methods to display a cell for each todo item.
