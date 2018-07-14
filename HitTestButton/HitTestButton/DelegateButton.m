//
//  DelegateButton.m
//  HitTestButton
//
//  Created by joynices on 2018/7/14.
//  Copyright © 2018年 com.joynices. All rights reserved.
//

#import "DelegateButton.h"

@implementation DelegateButton
{
    BOOL delegateButtonState;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(delegateButtonShouldTap:)]) {
        delegateButtonState = [self.delegate delegateButtonShouldTap:self];
    }
    if (delegateButtonState) {
        if ([self.delegate respondsToSelector:@selector(delegateButtonWillTap:)]) {
            [self.delegate delegateButtonWillTap:self];
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(delegateButtonDidTap:)]) {
        [self.delegate delegateButtonDidTap:self];
    }
}

@end
