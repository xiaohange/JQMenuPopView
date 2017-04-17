//
//  JQMenuPopView.m
//  Spread
//
//  Created by HaRi on 17/4/10.
//  Copyright © 2017年 HanJunqiang. All rights reserved.
//

#import "JQMenuPopView.h"

@implementation JQMenuPopView
/** 初始化视图 */
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initImageView];
        [self initCenterArrayWithFrame:frame];
        [self setUpView];
    }
    return self;
}

//初始化按钮视图(尺寸+图片,使用不同尺寸适配不同屏幕->)
-(void)initImageView{
    UIImage *image = [UIImage imageNamed:@"button-chat"];
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    _textButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _textButton.frame = frame;
    [_textButton setBackgroundImage:[UIImage imageNamed:@"button-text"] forState:UIControlStateNormal];
    
    _photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _photoButton.frame = frame;
    [_photoButton setBackgroundImage:[UIImage imageNamed:@"button-photo"] forState:UIControlStateNormal];
    
    _quoteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _quoteButton.frame = frame;
    [_quoteButton setBackgroundImage:[UIImage imageNamed:@"button-quote"] forState:UIControlStateNormal];
    
    _linkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _linkButton.frame = frame;
    [_linkButton setBackgroundImage:[UIImage imageNamed:@"button-link"] forState:UIControlStateNormal];
    
    _chatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _chatButton.frame = frame;
    [_chatButton setBackgroundImage:[UIImage imageNamed:@"button-chat"] forState:UIControlStateNormal];
    
    _videoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _videoButton.frame = frame;
    [_videoButton setBackgroundImage:[UIImage imageNamed:@"button-video"] forState:UIControlStateNormal];
    
    _nevermindButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _nevermindButton.frame = CGRectMake(0, 0, self.frame.size.width, _textButton.frame.size.height * 0.5);
    [_nevermindButton setTitle:@"以后再说" forState:UIControlStateNormal];
    [_nevermindButton setBackgroundColor:[UIColor redColor]];
    
    _backgroundView = [[UIView alloc] initWithFrame:self.frame];
    
    _textButton.tag = 0;
    _photoButton.tag = 1;
    _quoteButton.tag = 2;
    _linkButton.tag = 3;
    _chatButton.tag = 4;
    _videoButton.tag = 5;
}
//尺寸数组
-(void)initCenterArrayWithFrame:(CGRect)frame{
    
    //每个按钮的边长
    CGFloat widthUnit = frame.size.width * 0.25;
    //屏幕上方
    CGFloat heightHight = frame.origin.y - _textButton.frame.size.height * 0.5;
    //屏幕下方
    CGFloat heightLow = frame.size.height + _textButton.frame.size.height * 0.5;
    //按钮直接间隔距离
    CGFloat gap = _textButton.frame.size.height * 0.5 + 5;
    
    //上移尺寸
    _centerHigh = [[NSMutableArray alloc] initWithObjects:[NSValue valueWithCGPoint:CGPointMake(widthUnit, heightHight)], [NSValue valueWithCGPoint:CGPointMake(widthUnit * 2, heightHight)],[NSValue valueWithCGPoint:CGPointMake(widthUnit * 3, heightHight)],nil];
    
    //下移尺寸
    _centerLow = [[NSMutableArray alloc] initWithObjects:[NSValue valueWithCGPoint:CGPointMake(widthUnit, heightLow)], [NSValue valueWithCGPoint:CGPointMake(widthUnit * 2, heightLow)],[NSValue valueWithCGPoint:CGPointMake(widthUnit * 3, heightLow)],[NSValue valueWithCGPoint:CGPointMake(widthUnit * 2, frame.size.height + _nevermindButton.frame.size.height * 0.5)],nil];
    
    //中间显示尺寸
    _centerMenu = [[NSMutableArray alloc] initWithObjects:
                   [NSValue valueWithCGPoint:CGPointMake(widthUnit, frame.size.height * 0.5 - gap)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnit * 2, frame.size.height * 0.5 - gap)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnit * 3, frame.size.height * 0.5 - gap)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnit, frame.size.height * 0.5 + gap)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnit * 2, frame.size.height * 0.5 + gap)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnit * 3, frame.size.height * 0.5 + gap)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnit * 2, frame.size.height - _nevermindButton.frame.size.height * 0.5)],
                   nil];
}
//初始化视图
-(void)setUpView{
    self.hidden = YES;
    
    _backgroundView.backgroundColor = [UIColor colorWithRed:55.0/265.0 green:69/265.0 blue:93.0/265.0 alpha:1.0];
    
    //增加点击事件
    UITapGestureRecognizer *gestur = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    [_backgroundView setUserInteractionEnabled:YES];
    [_backgroundView addGestureRecognizer:gestur];
    
    _nevermindButton.hidden = YES;
    [_nevermindButton setUserInteractionEnabled:YES];
    [_nevermindButton setBackgroundColor:[UIColor colorWithRed:61/255.0 green:77/255.0 blue:100/255.0 alpha:1]];
    [_nevermindButton setTintColor:[UIColor colorWithRed:133/255.0 green:141/255.0 blue:152/255.0 alpha:1]];
    
    //监听方法->
    [_nevermindButton addTarget:self action:@selector(handleTap) forControlEvents:UIControlEventTouchUpInside];
    [_textButton addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    [_photoButton addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    [_quoteButton addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    [_linkButton addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    [_chatButton addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    [_videoButton addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加子视图!
    [self addSubview:_backgroundView];
    [self addSubview:_textButton];
    [self addSubview:_photoButton];
    [self addSubview:_quoteButton];
    [self addSubview:_linkButton];
    [self addSubview:_chatButton];
    [self addSubview:_videoButton];
    [self addSubview:_nevermindButton];
}

//取消的动画往下移动进而消失
-(void)handleTap{
    [self hideMenuViewWithCancel];
}

//点击方法执行代理
-(void)clickMenu:(UIButton *)button{
    NSInteger selectedIndex = button.tag;
    if (_menuPopDelegate && [_menuPopDelegate respondsToSelector:@selector(JQMenuPopView:didSelectedMenuIndex:)]) {
        [self hideMenuViewTop];
        [_menuPopDelegate JQMenuPopView:self didSelectedMenuIndex:selectedIndex];
    }
}
//向上Pop
-(void)hideMenuViewTop
{
    if (_isHidding) {
        return;
    }
    
    _isHidding = YES;
    
    /*   _nevermindButton   */
    _nevermindButton.center = [ _centerMenu[6] CGPointValue];
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _nevermindButton.center = [ _centerLow[3] CGPointValue];
        
    } completion:^(BOOL finished) {
        _nevermindButton.hidden = YES;
        _isHidding = NO;
        
    }];
    
    /*   _photoButton   */
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _photoButton.center = [ _centerHigh[1] CGPointValue];
        
    } completion:^(BOOL finished) {
        self.hidden = YES;
        
    }];
    
    
    /*  Text | Chat | Quote Image   */
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        _textButton.center =  [_centerHigh[0] CGPointValue];
        _quoteButton.center = [_centerHigh[2] CGPointValue];
        _chatButton.center =  [_centerHigh[1] CGPointValue];
        
    } completion:^(BOOL finished) {
        
    }];
    
    /*   Link | Video Image  */
    _photoButton.center = [ _centerHigh[1] CGPointValue];
    [UIView animateWithDuration:0.6 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _linkButton.center = [_centerHigh[0] CGPointValue];
        _videoButton.center = [_centerHigh[2] CGPointValue];
    } completion:^(BOOL finished) {
        
    }];
    
    
}
//向底部Pop
-(void)hideMenuViewWithCancel
{
    if (_isHidding) {
        return;
    }
    
    _isHidding = YES;
    
    /*   _nevermindButton   */
    _nevermindButton.center = [ _centerMenu[6] CGPointValue];
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _nevermindButton.center = [ _centerLow[3] CGPointValue];
        
    } completion:^(BOOL finished) {
        _nevermindButton.hidden = YES;
        _isHidding = NO;
        
    }];
    
    /*   _photoButton   */
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _photoButton.center = [ _centerLow[1] CGPointValue];
        
    } completion:^(BOOL finished) {
        self.hidden = YES;
        
    }];
    
    
    /*  Text | Chat | Quote Image   */
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        _textButton.center =  [_centerLow[0] CGPointValue];
        _quoteButton.center = [_centerLow[2] CGPointValue];
        _chatButton.center =  [_centerLow[1] CGPointValue];
        
    } completion:^(BOOL finished) {
        
    }];
    
    /*   Link | Video Image  */
    _photoButton.center = [ _centerHigh[1] CGPointValue];
    [UIView animateWithDuration:0.6 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _linkButton.center = [_centerLow[0] CGPointValue];
        _videoButton.center = [_centerLow[2] CGPointValue];
    } completion:^(BOOL finished) {
        
    }];
    
    
}
//展示弹出视图
-(void)showMenu
{
    self.hidden = NO;
    
    /*   _nevermindButton   */
    _nevermindButton.center = [_centerLow[3] CGPointValue];
    _nevermindButton.hidden = NO;
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _nevermindButton.center = [_centerMenu [6] CGPointValue];
    } completion:^(BOOL finished) {
        
    }];
    
    /*   _photoButton   */
    
    _photoButton.center = [_centerLow[1] CGPointValue];
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _photoButton.center = [_centerMenu[1] CGPointValue];
    } completion:^(BOOL finished) {
        
    }];
    
    /*  Text | Chat | Quote Image   */
    _textButton.center = [_centerLow[0] CGPointValue];
    _quoteButton.center = [_centerLow[2] CGPointValue];
    _chatButton.center = [_centerLow [1] CGPointValue];
    [UIView animateWithDuration:0.6 delay:0.1 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        _textButton.center = [_centerMenu[0] CGPointValue];
        _quoteButton.center = [_centerMenu[2] CGPointValue];
        _chatButton.center = [_centerMenu[4] CGPointValue];
    } completion:^(BOOL finished) {
        
    }];
    
    
    /*   Link | Video Image  */
    
    _linkButton.center = [_centerLow[0] CGPointValue];
    _videoButton.center = [_centerLow [2] CGPointValue];
    [UIView animateWithDuration:0.6 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _linkButton.center = [_centerMenu[3] CGPointValue];
        _videoButton.center = [_centerMenu[5] CGPointValue];
    } completion:^(BOOL finished) {
        
    }];
}
@end
