//
//  ViewController.m
//  Led Array
//
//  Created by macbook on 9/27/15.
//  Copyright (c) 2015 Maskma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

{
    CGFloat _margin;
    CGFloat _BallDiameter;
    int MaxBallofRow;
    int MaxBallofColumn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//Initialization
    
    _BallDiameter = 24.0;
    _margin = 2 * _BallDiameter;
    MaxBallofColumn = ((self.view.bounds.size.width - _margin) / _BallDiameter) - 1;
    MaxBallofRow = ((self.view.bounds.size.height - 2 * _margin) / _BallDiameter) - 1;
    
//Run
    [self drawBallwithNumOfRows: MaxBallofRow NumOfColumns: MaxBallofColumn withLimit: true];
    
}


- (CGFloat) SpaceWithNumberofBallofColumnIs: (int) n
                                  withLimit: (BOOL) limit
{
    if (limit) return n < MaxBallofColumn ? (self.view.bounds.size.width / (n + 1)) : (self.view.bounds.size.width / (MaxBallofColumn + 1));
    else       return (self.view.bounds.size.width / (n + 1));
}


- (CGFloat) SpaceWithNumberofBallofRowIs: (int) n
                               withLimit: (BOOL) limit
{
    if (limit) return n < MaxBallofRow ? (self.view.bounds.size.height / (n + 1)) : (self.view.bounds.size.height / (MaxBallofRow + 1));
    else       return (self.view.bounds.size.height / (n + 1));
}

- (void) createNewLedAtX: (CGFloat) x
                    andY: (CGFloat) y
                 withTag: (int) tag
{
    UIImageView * led = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"GreenLed.png"]];
    led.bounds = CGRectMake(led.frame.origin.x, led.frame.origin.y, _BallDiameter, _BallDiameter);
    led.center = CGPointMake(x, y);
    led.tag = tag;
    [self.view addSubview: led];
}

- (void) drawBallwithNumOfRows: (int) n
                  NumOfColumns: (int) m
                     withLimit: (BOOL) limit
{
    CGFloat spaceRow = [self SpaceWithNumberofBallofRowIs: n withLimit: limit];
    CGFloat spaceColumn = [self SpaceWithNumberofBallofColumnIs: m withLimit: limit];
    
    if (limit) {
        if (n > MaxBallofRow) n = MaxBallofRow;
        if (m > MaxBallofColumn) m = MaxBallofColumn;
    }
    
    for (int i = 0; i < n; i ++) {
        for (int j = 0; j < m; j ++)
            [self createNewLedAtX: spaceColumn * (j + 1) andY: spaceRow * (i + 1) withTag: i * m + j + 1];
    }
}

@end

