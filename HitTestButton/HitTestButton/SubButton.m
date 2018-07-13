//
//  SubButton.m
//  test1
//
//  Created by joynices on 2018/7/13.
//  Copyright © 2018年 com.joynices. All rights reserved.
//

#import "SubButton.h"

@implementation SubButton

- (CGRect)backgroundRectForBounds:(CGRect)bounds {
//    return bounds;
    return CGRectMake(0, 0, bounds.size.width+30, bounds.size.height+30);
}

- (CGRect)contentRectForBounds:(CGRect)bounds {
    return bounds;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, contentRect.size.height-20, contentRect.size.width, 20);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height-20);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return CGRectContainsPoint(hitTestRect(self.bounds, self.bounds.size.width+30, self.bounds.size.height+30), point);
}

CGRect hitTestRect(CGRect bounds, CGFloat minimumHitTestWidth, CGFloat minimumHitTestHeight) {
    CGRect tempBounds = bounds;
    if (minimumHitTestWidth > bounds.size.width) {
        tempBounds.size.width = minimumHitTestWidth;
        tempBounds.origin.x -= (minimumHitTestWidth - bounds.size.width) / 2;
    }
    if (minimumHitTestHeight > bounds.size.height) {
        tempBounds.size.height = minimumHitTestHeight;
        tempBounds.origin.y -= (minimumHitTestHeight - bounds.size.height) / 2;
    }
    return tempBounds;
}

@end
