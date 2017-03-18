# 模仿手Q的侧滑菜单
### 先上效果图  

![](https://ww4.sinaimg.cn/large/006tNbRwgy1fdq0b6a5jfg30af0ij4qp.gif)

最近有这个需求，就看了一下 github 上的轮子。有些东西不太符合自己的要求，就自己动手写了个。  
### 说下思路
就是自己实现 view controller 容器，然后把侧滑菜单和 主 view controller 加上去。
    
```objective-c
[self addChildViewController:self.leftVC];
[self.view addSubview:self.leftVC.view];
// 这个就是当父 view 的 bounds 改变时，如何调整子 view
self.leftVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight; 
[self.leftVC didMoveToParentViewController:self];

```
首先这里的问题是有没有必要 addChildViewController。是有必要的，需要处理一些响应事件。

```objective-c
- (void)showLeftVC {
    self.leftVC.view.width = self.needShowLeftWidth;
    [UIView animateWithDuration:self.animationDuration animations:^{
        self.leftVC.view.left = 0;
        self.mainVC.view.left = self.leftVC.view.right;
    } completion:^(BOOL finished) {
        // TO DO
    }];
    
}
```
当需要展示的时候，就可以自己实现动画了。

```objective-c
@interface QPEdgeMenuController : UIViewController

- (instancetype)initWithMainVC:(UIViewController *)mainVC leftVC:(UIViewController *)leftVC;

@property (nonatomic, strong, readonly) UIViewController *leftVC;
@property (nonatomic, strong, readonly) UIViewController *mainVC;
// 0.25;
@property (nonatomic, assign) CGFloat animationDuration; 
// 70 % screen width                        
@property (nonatomic, assign) CGFloat needShowLeftWidth;                        
@property (nonatomic, assign, readonly) BOOL isShowingLeft;

- (void)showLeftVC;
- (void)showMainVC;

@end
```
这是暴露需要的给外面。
### 缺陷
手势的操作我是给 mainVC 加了一个 pan 手势。但是滑动的时候处理感觉没有手Q做的好。

