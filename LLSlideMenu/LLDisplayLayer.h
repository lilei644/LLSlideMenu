//
//  LLDisplayLayer.h
//  LLSideMenuDemo
//
//  Created by admin on 15/11/20.
//  Copyright © 2015年 LiLei. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface LLDisplayLayer : CALayer

// layer的width
@property (nonatomic, assign) CGFloat bgWidth;

// 背景色
@property (nonatomic, strong) UIColor *menuBgColor;

// 间距
@property (nonatomic, assign) CGFloat distance;

// 是否正在动画
@property (nonatomic, assign) BOOL isAnimating;

// 贝塞尔曲线
@property (nonatomic, strong) UIBezierPath *bezier;

@end
