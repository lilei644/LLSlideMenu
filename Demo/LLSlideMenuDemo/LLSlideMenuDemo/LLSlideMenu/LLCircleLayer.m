//
//  LLCircleLayer.m
//  LLSlideMenuDemo
//
//  Created by admin on 15/11/24.
//  Copyright © 2015年 LiLei. All rights reserved.
//

#import "LLCircleLayer.h"

@implementation LLCircleLayer

//=====================
// 初始化
//=====================
- (instancetype)init {
    if (self = [super init]) {
        // 默认属性
        _radius = 0;
        _center = CGPointMake(0, 0);
    }
    return self;
}

- (instancetype)initWithLayer:(LLCircleLayer *)layer {
    self = [super initWithLayer:layer];
    if (self) {
        self.radius = layer.radius;
        self.center = layer.center;
    }
    return self;
}

//=====================
// Draw
//=====================
- (void)drawInContext:(CGContextRef)ctx {
    UIBezierPath *bezier = [UIBezierPath bezierPathWithArcCenter:_center radius:_radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [bezier closePath];
    CGContextAddPath(ctx, bezier.CGPath);
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextFillPath(ctx);
}


//=====================
// 关键帧动画key
//=====================
+(BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqual:@"radius"]) {
        return  YES;
    }
    return  [super needsDisplayForKey:key];
}

@end
