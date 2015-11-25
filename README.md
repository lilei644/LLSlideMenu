# LLSlideMenu
This is a spring slide menu for iOS apps<br>
一个弹性侧滑菜单<br><br>

## Preview &nbsp;预览
![image](https://github.com/lilei644/LLSlideMenu/blob/master/Preview/LLSlideMenuPreview.gif)

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

```
* Open or Close &nbsp;打开或关闭
```
[_slideMenu ll_openSlideMenu];      // 打开  open
[_slideMenu ll_closeSlideMenu];     // 关闭  close
```
*GestureRecognizer &nbsp; 手势监听
```
_slideMenu.ll_distance = 100.f;     // 拉伸距离  pulling distance
```