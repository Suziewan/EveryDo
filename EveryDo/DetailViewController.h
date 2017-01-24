//
//  DetailViewController.h
//  EveryDo
//
//  Created by Angie Linton on 2017-01-24.
//  Copyright © 2017 Angie Linton. All rights reserved.
//

#import <UIKit/UIKit.h> 
@class ToDo; 

@interface DetailViewController : UIViewController

//@property (nonatomic) NSString *title;
@property (nonatomic) ToDo *todo;
@end
