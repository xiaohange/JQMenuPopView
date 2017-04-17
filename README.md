# JQMenuPopView
仿Tumblr弹出视图发音频、视频、图片、文字的视图，接入方便。高仿Tumblr,tumblr-popview.
<<<<<<< HEAD

![]()

## Instalation

Add the JQMenuPopView.h and JQMenuPopView.m source files to your project.

## Usage

```objective-c
@property (nonatomic, strong) JQMenuPopView *myMenuPopView;

_myMenuPopView = [[JQMenuPopView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];

[_myMenuPopView setMenuPopDelegate:self];
    
UIWindow *window = [UIApplication sharedApplication].keyWindow;[window addSubview:_myMenuPopView];
    
[_myMenuPopView showMenu];
```
***MenuPopDelegate*** 代理方法：
```
-(void)JQMenuPopView:(JQMenuPopView *)MenuPopView didSelectedMenuIndex:(NSInteger)selectedIndex{
    NSLog(@"->>didSelectedMenuIndex->>点击的是第%ld个按钮",selectedIndex);
}
```

=======
>>>>>>> 87a5781cf702cdba82f653f949f4b6b5070714cf
## Star
>iOS开发者交流群：446310206 喜欢就❤️❤️❤️star一下吧！你的支持是我更新的动力！ Love is every every every star! Your support is my renewed motivation!

## Other
[JQTumblrHud-高仿Tumblr App 加载指示器hud](https://github.com/xiaohange/JQTumblrHud)

[JQScrollNumberLabel：仿tumblr热度滚动数字条数](https://github.com/xiaohange/JQScrollNumberLabel)

[TumblrLikeAnimView-仿Tumblr点赞动画效果](https://github.com/xiaohange/TumblrLikeAnimView)

[JQMenuPopView-仿Tumblr弹出视图发音频、视频、图片、文字的视图](https://github.com/xiaohange/JQMenuPopView)

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE). 
