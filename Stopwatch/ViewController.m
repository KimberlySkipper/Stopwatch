//
//  ViewController.m
//  Stopwatch
//
//  Created by HSummy on 11/30/16.
//  Copyright © 2016 HSummy and Kimmy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () < UITableViewDataSource, UITableViewDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.laps = [[NSMutableArray alloc] init];
    
    self.lapTime = 0;
     self.timeLabel.text = [NSString stringWithFormat:@"%ld sec", (long)self.lapTime];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action handlers

- (IBAction)start:(UIButton *)sender
{
    if (!self.myCoolFuckingNSTimer)
    {
    self.myCoolFuckingNSTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
        
    self.timeLabel.text = [NSString stringWithFormat:@"%ld sec", (long)self.lapTime];
    }
    
}


- (IBAction)stop:(UIButton *)sender
{
    [self.myCoolFuckingNSTimer invalidate];
    self.myCoolFuckingNSTimer = nil;
    
}

- (IBAction)reset:(UIButton *)sender
{
    
    [self.myCoolFuckingNSTimer invalidate];
    self.myCoolFuckingNSTimer = nil;
    self.lapTime = 0;
    self.timeLabel.text = [NSString stringWithFormat:@"%ld sec", (long)self.lapTime];
    [self.lapTimeDisplay reloadData];

    
}


- (IBAction)laptime:(UIButton *)sender
{
    [self.laps addObject: [NSString stringWithFormat:@"%ld sec", (long)self.lapTime]];
    [self.lapTimeDisplay reloadData];
  
}


#pragma mark - Time

- (void)timerFired

{
    if (self.lapTime <= 60)
    {
        self.lapTime = self.lapTime + 1;
        self.timeLabel.text = [NSString stringWithFormat:@"%ld sec", (long)self.lapTime];
       
    }
    else
    {
        [self.myCoolFuckingNSTimer invalidate];
        self.myCoolFuckingNSTimer = nil;
    }
    
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.laps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LapTimeCell" forIndexPath:indexPath];
    long rowNum = [self.laps count] - indexPath.row;
    NSString *lapNumbers = [NSString stringWithFormat:@"Lap %ld", rowNum] ;
    NSString *aLap = self.laps[[self.laps count] - 1 - indexPath.row];
   //  NSString *aLap = self.laps[indexPath.row];
    cell.textLabel.text = aLap;
    cell.detailTextLabel.text = lapNumbers;
    
    return cell;
}

@end
