//
//  AnimationManager.m
//  LLSideMenuDemo
//
//  Created by admin on 15/11/22.
//  Copyright © 2015年 LiLei. All rights reserved.
//

#import "LLAnimationManager.h"
#import "LLSlideMenu.h"


#define LL_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//=====================
// anim key
//=====================
static NSString *ANIM_STARTBASE = @"startLLSlideBaseAnimate";
static NSString *ANIM_STARTSPRING = @"startLLSlideSpringAnimate";
static NSString *ANIM_STARTCIRCLE = @"startLLCircleAnimate";
static NSString *ANIM_ENDBASE = @"endLLSlideBaseAnimate";
static NSString *ANIM_ENDSPRING = @"endLLSlideSpringAnimate";
static NSString *ANIM_ENDCIRCLE = @"endLLCircleAnimate";


@class LLSlideMune;
@implementation LLAnimationManager


//=====================
// 开始动画
//=====================
- (void)startAnimate{
    // 判断是否滑动超出宽度
    if (_layer.distance >= _layer.bgWidth) {
        _layer.isAnimating = YES;
        CAKeyframeAnimation *animSpring = [self createSpringAnima:@"distance" duration:2.f usingSpringWithDamping:0.5 initialSpringVelocity:3 fromValue:@(0) toValue:@(_layer.bgWidth)];
        [_layer addAnimation:animSpring forKey:ANIM_STARTSPRING];
        CAKeyframeAnimation *animCircle = [self createBaseAnima:@"radius" duration:.8f fromValue:@(0) toValue:@(sqrt(_circleLayer.frame.size.width * _circleLayer.frame.size.width + _circleLayer.frame.size.height * _circleLayer.frame.size.width))];
        [_circleLayer addAnimation:animCircle forKey:ANIM_STARTCIRCLE];
    } else {
        CAKeyframeAnimation *animaBase = [self createBaseAnima:@"distance" duration:.2f fromValue:@(_layer.distance) toValue:@(_layer.bgWidth)];
        [_layer addAnimation:animaBase forKey:ANIM_STARTBASE];
        _layer.distance = _layer.bgWidth;
    }
    
}


//=====================
// 结束动画
//=====================
- (void)endAnimate{
    //====================================
    // 判断如否distance则先变成圆弧在缩小圆弧
    //====================================
    if (_layer.distance >= _layer.bgWidth) {
        // 关闭背景layer
        CAKeyframeAnimation *animBase = [self createBaseAnima:@"distance" duration:.3f fromValue:@(_layer.bgWidth) toValue:@(0)];
        [_layer addAnimation:animBase forKey:ANIM_ENDBASE];
        // 关闭contentView
        CAKeyframeAnimation *animCircle = [self createBaseAnima:@"radius" duration:.3f fromValue:@(_circleLayer.frame.size.width) toValue:@(0)];
        [_circleLayer addAnimation:animCircle forKey:ANIM_ENDCIRCLE];
    }else {
        _layer.isAnimating = NO;
        CAKeyframeAnimation *animSpring = [self createSpringAnima:@"distance" duration:1.5f usingSpringWithDamping:0.5 initialSpringVelocity:3 fromValue:@(_layer.distance) toValue:@(0)];
        [_layer addAnimation:animSpring forKey:ANIM_ENDSPRING];
    }
    
}

//=====================
// 创建普通动画
//=====================
-(CAKeyframeAnimation *)createBaseAnima:(NSString *)keypath
                               duration:(CFTimeInterval)duration
                                fromValue:(id)fromValue
                                  toValue:(id)toValue{
    NSMutableArray *values = [NSMutableArray arrayWithObjects:fromValue,toValue,nil];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:keypath];
    anim.values = values;
    anim.duration = duration;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    anim.delegate = self;
    return anim;
}

//=====================
// 创建弹性动画
//=====================
-(CAKeyframeAnimation *)createSpringAnima:(NSString *)keypath
                                 duration:(CFTimeInterval)duration
                   usingSpringWithDamping:(CGFloat)damping
                    initialSpringVelocity:(CGFloat)velocity
                                fromValue:(id)fromValue
                                  toValue:(id)toValue{
    
//    CGFloat dampingFactor  = 20.0;
//    CGFloat velocityFactor = 15.0;
    NSMutableArray *values = [self springAnimationValues:fromValue toValue:toValue usingSpringWithDamping:damping * _springDamping initialSpringVelocity:velocity * _springVelocity duration:duration];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:keypath];
    anim.values = values;
    anim.duration = duration;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    anim.delegate = self;
    return anim;
}


//=====================
// 获取关键帧的属性值
//=====================
-(NSMutableArray *) springAnimationValues:(id)fromValue toValue:(id)toValue usingSpringWithDamping:(CGFloat)damping initialSpringVelocity:(CGFloat)velocity duration:(CGFloat)duration{
    
    //关键帧
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:_springNumOfFrames];
    for (NSInteger i = 0; i < _springNumOfFrames; i++) {
        [values addObject:@(0.0)];
    }
    //差值
    CGFloat diff = [toValue floatValue] - [fromValue floatValue];
    
    for (NSInteger frame = 0; frame<_springNumOfFrames; frame++) {
        
        CGFloat x = (CGFloat)frame / (CGFloat)_springNumOfFrames;
        CGFloat value = [toValue floatValue] - diff * (pow(M_E, -damping * x) * cos(velocity * x)); // y = 1-e^{-5x} * cos(30x)
        
        values[frame] = @(value);
    }
    
    return values;
}

//=====================
// 动画结束
//=====================
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        if (anim == [_layer animationForKey:ANIM_STARTBASE]) {
            [_layer removeAllAnimations];
            _layer.isAnimating = YES;
            _llSildeMenu.ll_isOpen = YES;
            CAKeyframeAnimation *animSpring = [self createSpringAnima:@"distance" duration:2.f usingSpringWithDamping:0.5 initialSpringVelocity:3 fromValue:@(0) toValue:@(_layer.bgWidth)];
            [_layer addAnimation:animSpring forKey:ANIM_STARTSPRING];
            CAKeyframeAnimation *animCircle = [self createBaseAnima:@"radius" duration:.8f fromValue:@(0) toValue:@(sqrt(_circleLayer.frame.size.width * _circleLayer.frame.size.width + _circleLayer.frame.size.height * _circleLayer.frame.size.width))];
            [_circleLayer addAnimation:animCircle forKey:ANIM_STARTCIRCLE];
            return;
        }
        if (anim == [_layer animationForKey:ANIM_STARTSPRING]) {
            _layer.distance = _layer.bgWidth;
            [_layer removeAllAnimations];
            _llSildeMenu.ll_isOpen = YES;
            _isAnimating = NO;
            return;
        }
        if (anim == [_layer animationForKey:ANIM_ENDBASE]) {
            [_layer removeAllAnimations];
            _layer.distance = _layer.bgWidth;
            _layer.isAnimating = NO;
            CAKeyframeAnimation *animSpring = [self createSpringAnima:@"distance" duration:2.f usingSpringWithDamping:0.5 initialSpringVelocity:3 fromValue:@(_layer.bgWidth) toValue:@(0)];
            [_layer addAnimation:animSpring forKey:@"endLLSlideSpringAnimate"];
            return;
        }
        if (anim == [_layer animationForKey:ANIM_ENDSPRING]) {
            _layer.distance = 0;
            _isAnimating = NO;
            [_layer removeAllAnimations];
            _llSildeMenu.hidden = YES;
            _llSildeMenu.ll_isOpen = NO;
            return;
        }
        if (anim == [_circleLayer animationForKey:ANIM_ENDCIRCLE]) {
            _circleLayer.radius = 0;
            [_circleLayer removeAllAnimations];
            return;
        }
        if (anim == [_circleLayer animationForKey:ANIM_STARTCIRCLE]) {
            _circleLayer.radius = sqrt(_circleLayer.frame.size.width * _circleLayer.frame.size.width + _circleLayer.frame.size.height * _circleLayer.frame.size.width);
            [_circleLayer removeAllAnimations];
            return;
        }
    }
}


@end
