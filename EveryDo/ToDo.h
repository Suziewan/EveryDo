//
//  ToDo.h
//  EveryDo
//
//  Created by Angie Linton on 2017-01-24.
//  Copyright © 2017 Angie Linton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *todoDescription;
@property (nonatomic) NSString  *priority;
@property (nonatomic) BOOL isComplete;

@end

//Create a Todo object which has the following properties:
//title
//todoDescription (note: a property cannot be named description, as that's already in use)
//priority number
//is completed indicator
