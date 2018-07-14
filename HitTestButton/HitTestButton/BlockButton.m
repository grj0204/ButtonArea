//
//  BlockButton.m
//  HitTestButton
//
//  Created by joynices on 2018/7/14.
//  Copyright © 2018年 com.joynices. All rights reserved.
//

#import "BlockButton.h"

@interface BlockButton ()

@property (nonatomic, strong) ButtonWillAndDidBlock willBlock;
@property (nonatomic, strong) ButtonWillAndDidBlock didBlock;
@property (nonatomic, strong) ButtonShouldBlock shouldBlock;

@end

@implementation BlockButton
{
    BOOL blockButtonState;
}

- (void)setButtonWillBlock:(ButtonWillAndDidBlock)block {
    self.willBlock = block;
}

- (void)setButtonDidBlock:(ButtonWillAndDidBlock)block {
    self.didBlock = block;
}

- (void)setButtonShouldBlock:(ButtonShouldBlock)block {
    self.shouldBlock = block;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.shouldBlock) {
        blockButtonState = self.shouldBlock(self);
    }
    
    if (blockButtonState) {
        if (self.willBlock) {
            self.willBlock(self);
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.didBlock) {
        self.didBlock(self);
    }
}


@end
