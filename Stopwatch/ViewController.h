//
//  ViewController.h
//  Stopwatch
//
//  Created by HSummy on 11/30/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITableView *lapTimeDisplay;

@property (assign) NSInteger lapTime;
@property (nonatomic) NSTimer *myCoolFuckingNSTimer;

@property (nonatomic) NSMutableArray *laps;

@end

