//
//  AnimationManager.h
//  LLSideMenuDemo
//
//  Created by admin on 15/11/22.
//  Copyright © 2015年 LiLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LLDisplayLayer.h"
#import "LLCircleLayer.h"

@class LLSlideMune;
@interface LLAnimationManager : NSObject

// 是否正在动画
@property (nonatomic, assign) BOOL isAnimating;

@property (nonatomic, strong) LLDisplayLayer *layer;
@property (nonatomic, strong) LLCircleLayer *circleLayer;

@property (nonatomic, strong) LLSlideMune *llSildeMenu;


// 开始动画
- (void)startAnimate;

// 结束动画
- (void)endAnimate;

@end
