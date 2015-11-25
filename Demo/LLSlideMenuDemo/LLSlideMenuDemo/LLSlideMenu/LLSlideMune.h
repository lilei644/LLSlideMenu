//
//  LLSideMune.h
//  LLSideMenuDemo
//
//  Created by admin on 15/11/20.
//  Copyright © 2015年 LiLei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLAnimationManager.h"


@interface LLSlideMune : UIView

// MenuView width
@property (nonatomic, assign) CGFloat ll_menuWidth;
// slide distance
@property (nonatomic, assign) CGFloat ll_distance;
// background color
@property (nonatomic, strong) UIColor *ll_menuBackgroundColor;

// animate manager
@property (nonatomic, strong) LLAnimationManager *ll_animManager;

// 菜单是否打开
@property (nonatomic, assign) BOOL ll_isOpen;


// close menu
- (void)ll_closeSlideMenu;

// open menu
- (void)ll_openSlideMenu;


@end
