//
//  BlockButton.h
//  HitTestButton
//
//  Created by joynices on 2018/7/14.
//  Copyright © 2018年 com.joynices. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlockButton;
typedef void(^ButtonWillAndDidBlock)(BlockButton *sender);
typedef BOOL(^ButtonShouldBlock)(BlockButton *sender);

@interface BlockButton : UIView

- (void)setButtonShouldBlock:(ButtonShouldBlock)block;

- (void)setButtonWillBlock:(ButtonWillAndDidBlock)block;

- (void)setButtonDidBlock:(ButtonWillAndDidBlock)block;

@end
