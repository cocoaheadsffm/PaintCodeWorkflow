//
//  ViewController.m
//  PaintCodeDemo
//
//  Copyright (c) 2015 Flori + Carl. All rights reserved.
//

#import "ViewController.h"
#import "ClockView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ClockView *leftClock;
@property (weak, nonatomic) IBOutlet ClockView *rightClock;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(animate) userInfo:nil repeats:YES];
}

- (void)animate {
    NSLog(@"animate");
    [self.leftClock refresh];
    [self.rightClock refresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
