//
//  DelegateButton.h
//  HitTestButton
//
//  Created by joynices on 2018/7/14.
//  Copyright © 2018年 com.joynices. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DelegateButton;

@protocol DelelegateButtonDelegate <NSObject>

- (void)delegateButtonWillTap:(DelegateButton *)sender;

- (void)delegateButtonDidTap:(DelegateButton *)sender;

- (BOOL)delegateButtonShouldTap:(DelegateButton *)sender;


@end

@interface DelegateButton : UIView

@property (nonatomic, weak) id<DelelegateButtonDelegate> delegate;

@end


