//
//  LLDisplayLayer.m
//  LLSideMenuDemo
//
//  Created by admin on 15/11/20.
//  Copyright © 2015年 LiLei. All rights reserved.
//

#import "LLDisplayLayer.h"

#define LL_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation LLDisplayLayer

//=====================
// 初始化
//=====================
- (instancetype)init {
    if (self = [super init]) {
        // 默认属性
        _menuBgColor = [UIColor whiteColor];
        _isAnimating = NO;
    }
    return self;
}

- (instancetype)initWithLayer:(LLDisplayLayer *)layer {
    self = [super initWithLayer:layer];
    if (self) {
        self.bgWidth = layer.bgWidth;
        self.menuBgColor = layer.menuBgColor;
        self.distance = layer.distance;
        self.isAnimating = layer.isAnimating;
        self.bezier = layer.bezier;
    }
    return self;
}


//=====================
// 关键帧动画key
//=====================
+(BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqual:@"distance"]) {
        return  YES;
    }
    return  [super needsDisplayForKey:key];
}


//=====================
// Draw
//=====================
- (void)drawInContext:(CGContextRef)ctx {
    _bezier = [UIBezierPath bezierPath];
    CGPoint pointStart,pointA,pointB,pointEnd;
    
    // 区分曲线路径
    if (_isAnimating) {
        pointStart = CGPointMake(_distance, 0);
        pointA = CGPointMake(_bgWidth, LL_SCREEN_HEIGHT/4);
        pointB = CGPointMake(_bgWidth, LL_SCREEN_HEIGHT * 3/4);
        pointEnd = CGPointMake(_distance, LL_SCREEN_HEIGHT);
        [_bezier moveToPoint:CGPointMake(0, 0)];
        [_bezier addLineToPoint:pointStart];
        [_bezier addCurveToPoint:pointEnd controlPoint1:pointA controlPoint2:pointB];
        [_bezier addLineToPoint:CGPointMake(0, LL_SCREEN_HEIGHT)];
    } else {
        pointStart = CGPointMake(0, 0);
        pointA = CGPointMake(_distance, LL_SCREEN_HEIGHT/4);
        pointB = CGPointMake(_distance, LL_SCREEN_HEIGHT * 3/4);
        pointEnd = CGPointMake(0, LL_SCREEN_HEIGHT);
        [_bezier moveToPoint:pointStart];
        [_bezier addCurveToPoint:pointEnd controlPoint1:pointA controlPoint2:pointB];
    }
    
    
    [_bezier closePath];
    CGContextAddPath(ctx, _bezier.CGPath);
    CGContextSetFillColorWithColor(ctx, _menuBgColor.CGColor);
    CGContextFillPath(ctx);
}


@end
