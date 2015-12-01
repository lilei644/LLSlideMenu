//
//  LLSideMune.h
//  LLSideMenuDemo
//
//  Created by admin on 15/11/20.
//  Copyright © 2015年 LiLei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLAnimationManager.h"


@interface LLSlideMenu : UIView

// MenuView width
@property (nonatomic, assign) CGFloat ll_menuWidth;
// slide distance
@property (nonatomic, assign) CGFloat ll_distance;
// background color
@property (nonatomic, strong) UIColor *ll_menuBackgroundColor;
// background image
@property (nonatomic, strong) UIImage *ll_menuBackgroundImage;

// animate manager
@property (nonatomic, strong) LLAnimationManager *ll_animManager;

// 菜单是否打开
@property (nonatomic, assign) BOOL ll_isOpen;

// 设置弹性 spring
@property (nonatomic, assign) CGFloat ll_springDamping;         // 阻力
@property (nonatomic, assign) CGFloat ll_springVelocity;        // 速度
@property (nonatomic, assign) NSInteger ll_springFramesNum;     // 关键帧个数


// close menu
- (void)ll_closeSlideMenu;

// open menu
- (void)ll_openSlideMenu;


@end
