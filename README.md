# LLSlideMenu
This is a spring slide menu for iOS apps<br>
一个弹性侧滑菜单<br><br>
弹性动画原理借鉴该[项目](https://github.com/KittenYang/KYAnimatedPageControl)中阻尼函数实现

## Preview &nbsp;预览
![image](https://github.com/lilei644/LLSlideMenu/blob/master/Preview/LLSlideMenuPreview.gif)

## Installation &nbsp;安装
* pod
```
    1.pod "LLSlideMenu"
    2.pod install       // 若获取失败请重新 pod setup
    3.#import "LLSlideMenu.h"
```
* Common
```
    1.Add "LLSlideMenu" files to your Project   // 直接导入“LLSlideMenu”文件夹到项目中
    2.#import "LLSlideMenu.h"
```

## Usage &nbsp;用法
* Init &nbsp;初始化
```
LLSlideMune *slideMenu = [[LLSlideMune alloc] init];
[self.view addSubview:slideMenu];
```
* Base Property &nbsp;基本属性
```
// 设置菜单宽度  menu width
_slideMenu.ll_menuWidth = 200.f;

// 设置菜单背景色  background color
_slideMenu.ll_menuBackgroundColor = [UIColor redColor];

// 设置菜单背景图片  background image
_slideMenu.ll_menuBackgroundImage = [UIImage imageNamed:@"image"];

// 背景色或背景图片设置一个即可  background image and color select one

```
* Open or Close &nbsp;打开或关闭
```
[_slideMenu ll_openSlideMenu];      // 打开  open
[_slideMenu ll_closeSlideMenu];     // 关闭  close
```
* GestureRecognizer &nbsp;手势监听
```
_slideMenu.ll_distance = 100.f;     // 拉伸距离  pulling distance
```
* Spring and Frames &nbsp;弹力和关键帧设置（可控制弹性效果和时间）
```
_slideMenu.ll_springDamping = 20;       // 阻力
_slideMenu.ll_springVelocity = 15;      // 速度
_slideMenu.ll_springFramesNum = 60;     // 关键帧数量
```

## Requirements &nbsp;版本要求
IOS 6.0 Above

## License
LLSlideMenu is provided under the MIT license. See LICENSE file for details.
