//
//  ViewController.m
//  DemoForLineIntersectsCheck
//
//  Created by darklinden on 14-9-12.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import "ViewController.h"
#import "V_draw.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    V_draw *pV_draw = (V_draw *)self.view;
    
    pV_draw.lmove = CGLineMake(0, 0, 320, 480);
    pV_draw.lcheck = CGLineMake(320, 0, 0, 480);
    pV_draw.rcheck = CGRectMake(20, 100, 200, 200);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self.view];
    
    V_draw *pV_draw = (V_draw *)self.view;
    
    pV_draw.lmove = CGLineMake(0, 0, p.x, p.y);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self.view];
    
    V_draw *pV_draw = (V_draw *)self.view;
    
    pV_draw.lmove = CGLineMake(0, 0, p.x, p.y);
}

@end
