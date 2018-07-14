//
//  TargetButton.m
//  HitTestButton
//
//  Created by joynices on 2018/7/14.
//  Copyright © 2018年 com.joynices. All rights reserved.
//

#import "TargetButton.h"

@interface TargetButton ()

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL action;

@end

@implementation TargetButton

- (void)addTarget:(id)target action:(SEL)action {
    self.target = target;
    self.action = action;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touche = [touches anyObject];
    CGPoint point = [touche locationInView:self];
    if (CGRectContainsPoint(self.bounds, point)) {
        [self.target performSelector:self.action withObject:self];
    }
}


@end
