//
//  JQMenuPopView.h
//  Spread
//
//  Created by HaRi on 17/4/10.
//  Copyright © 2017年 HanJunqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JQMenuPopView;

//定义选中协议
@protocol MenuPopDelegate <NSObject>

@required
/** 选择相应功能 */
-(void)JQMenuPopView:(JQMenuPopView *)MenuPopView didSelectedMenuIndex:(NSInteger)selectedIndex;

@end
@interface JQMenuPopView : UIView

/** 代理 */
@property (nonatomic, assign) id<MenuPopDelegate> menuPopDelegate;

//属性
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) NSMutableArray  * centerHigh;
@property (nonatomic, strong) NSMutableArray  * centerLow;
@property (nonatomic, strong) NSMutableArray  * centerMenu;
@property (nonatomic, assign) BOOL              isHidding ;
@property (nonatomic, strong) UIButton        * nevermindButton;

@property (nonatomic, strong) UIButton *textButton;
@property (nonatomic, strong) UIButton *photoButton;
@property (nonatomic, strong) UIButton *quoteButton;

@property (nonatomic, strong) UIButton *videoButton;
@property (nonatomic, strong) UIButton *linkButton;
@property (nonatomic, strong) UIButton *chatButton;

//展示弹出菜单
-(void)showMenu;

@end
