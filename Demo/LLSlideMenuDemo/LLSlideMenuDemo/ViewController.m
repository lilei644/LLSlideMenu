//
//  ViewController.m
//  LLSlideMenuDemo
//
//  Created by admin on 15/11/24.
//  Copyright © 2015年 LiLei. All rights reserved.
//

#import "ViewController.h"
#import "LLSlideMenu.h"

@interface ViewController ()

@property (nonatomic, strong) LLSlideMenu *slideMenu;

// 全屏侧滑手势
@property (nonatomic, strong) UIPanGestureRecognizer *leftSwipe;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    _slideMenu = [[LLSlideMenu alloc] init];
    [self.view addSubview:_slideMenu];
    // 设置菜单宽度
    _slideMenu.ll_menuWidth = 200.f;
    // 设置菜单背景色
    _slideMenu.ll_menuBackgroundColor = [UIColor redColor];
    // 设置弹力和速度，  默认的是20,15,60
    _slideMenu.ll_springDamping = 20;       // 阻力
    _slideMenu.ll_springVelocity = 15;      // 速度
    _slideMenu.ll_springFramesNum = 60;     // 关键帧数量
    
    
    
    //===================
    // Menu添加子View
    //===================
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(50, 40, 80, 80)];
    [img setImage:[UIImage imageNamed:@"Head"]];
    [_slideMenu addSubview:img];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 140, 150, 400)];
    label.text = @"这是第一行菜单\n\n这是第二行菜单\n\n这是第三行菜单\n\n这是第四行菜单\n\n这是第五行菜单\n\n这是第六行菜单\n\n这是第七行菜单\n\n这是第八行菜单\n\n这是第九行菜单\n\n这是第十行菜单";
    [label setTextColor:[UIColor whiteColor]];
    [label setNumberOfLines:0];
    [_slideMenu addSubview:label];
    
    
    //===================
    // 添加全屏侧滑手势
    //===================
    self.leftSwipe = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftHandle:)];
    self.leftSwipe.maximumNumberOfTouches = 1;
    [self.view addGestureRecognizer:_leftSwipe];
}



//===================
// 全屏侧滑手势监听
//===================
- (void)swipeLeftHandle:(UIScreenEdgePanGestureRecognizer *)recognizer {
    // 如果菜单已打开则禁止滑动
    if (_slideMenu.ll_isOpen) {
        return;
    }
    // 计算手指滑的物理距离（滑了多远，与起始位置无关）
    CGFloat progress = [recognizer translationInView:self.view].x / (self.view.bounds.size.width * 1.0);
    // 把这个百分比限制在 0~1 之间
    progress = MIN(1.0, MAX(0.0, progress));
    
    // 当手势刚刚开始，我们创建一个 UIPercentDrivenInteractiveTransition 对象
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.percent = [[UIPercentDrivenInteractiveTransition alloc] init];
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        // 当手慢慢划入时，我们把总体手势划入的进度告诉 UIPercentDrivenInteractiveTransition 对象。
        [self.percent updateInteractiveTransition:progress];
        _slideMenu.ll_distance = [recognizer translationInView:self.view].x;
        
    } else if (recognizer.state == UIGestureRecognizerStateCancelled || recognizer.state == UIGestureRecognizerStateEnded) {
        // 当手势结束，我们根据用户的手势进度来判断过渡是应该完成还是取消并相应的调用 finishInteractiveTransition 或者 cancelInteractiveTransition 方法.
        if (progress > 0.4) {
            [self.percent finishInteractiveTransition];
            [_slideMenu ll_openSlideMenu];
        }else{
            [self.percent cancelInteractiveTransition];
            [_slideMenu ll_closeSlideMenu];
        }
        self.percent = nil;
    }
}


//===================
// 按钮监听
//===================
- (IBAction)openLLSlideMenuAction:(id)sender {
    //===================
    // 打开菜单
    //===================
    if (_slideMenu.ll_isOpen) {
        [_slideMenu ll_closeSlideMenu];
    } else {
        [_slideMenu ll_openSlideMenu];
    }
}


@end
