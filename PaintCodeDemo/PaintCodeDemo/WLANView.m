//
//  WLANView.m
//  PaintCodeDemo
//
//  Copyright (c) 2015 Flori + Carl. All rights reserved.
//

#import "WLANView.h"
#import "StyleKitName.h"

@implementation WLANView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [StyleKitName drawWLANWithFrame:rect outer:self.isOuterActive inner:self.isInnerActive];
}

@end
