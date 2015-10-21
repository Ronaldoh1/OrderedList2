//
//  ViewController.h
//  OrderedList
//
//  Created by Ronald Hernandez on 10/20/15.
//  Copyright © 2015 Evernote. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderedListVC : UIViewController

-(NSArray *)mostFrequentWordsFromString:(NSString *)text maxCount:(NSUInteger )maxCount;

@end

