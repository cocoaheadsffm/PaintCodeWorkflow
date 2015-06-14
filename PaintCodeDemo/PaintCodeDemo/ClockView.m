//
//  ClockView.m
//  PaintCodeDemo
//
//  Copyright (c) 2015 Flori + Carl. All rights reserved.
//

#import "ClockView.h"
#import "StyleKitName.h"

@interface ClockView()
@property (nonatomic, assign) double currentSeconds;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSTimer *animationTimer;
@property (nonatomic, assign) double currentRefresh;
@end

@implementation ClockView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self calculateCurrentSeconds];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(refreshClock) userInfo:nil repeats:YES];
        
       [self refresh];
    }
    return self;
}

- (void)refresh {
    
    [self.animationTimer invalidate];
    self.currentRefresh = 0.;
    
    [self setNeedsDisplay];
    
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:1/60. target:self selector:@selector(refreshAnimationValue) userInfo:nil repeats:YES];
}

- (void)refreshAnimationValue {
    
    if (self.currentRefresh >= 1.) {
        [self.animationTimer invalidate];
        self.currentRefresh = 0.;
        
        [self setNeedsDisplay];
        return;
    }
    
    double animationTime =  1.;
    double step = animationTime / 60.;
    
    self.currentRefresh += step;
    
    [self setNeedsDisplay];
}


- (void)calculateCurrentSeconds {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDate *midnight = [calender startOfDayForDate:currentDate];
   
    double offset = currentDate.timeIntervalSince1970 - midnight.timeIntervalSince1970;
    
    double hours_12 = 12. * 60. * 60.;
    if (offset > hours_12) {
        offset -= hours_12;
    }
    self.currentSeconds = offset;

}

- (void)dealloc {
    
    [self.timer invalidate];
    [self.animationTimer invalidate];
}

- (void)drawRect:(CGRect)rect {
    [StyleKitName drawClockWithFrame:rect refresh:self.currentRefresh timeinterval:self.currentSeconds];
}
- (void)refreshClock {
    
    [self calculateCurrentSeconds];
    [self setNeedsDisplay];
}
- (void)prepareForInterfaceBuilder {
    [self refreshClock];
}


@end
