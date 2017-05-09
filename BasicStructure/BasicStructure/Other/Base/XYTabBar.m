//
//  XYTabBar.m
//  BasicStructure
//
//  Created by mxy on 2017/5/9.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import "XYTabBar.h"
#import "UIView+XYExtension.h"
@interface XYTabBar()

/** 发布按钮 **/
@property (nonatomic,weak)UIButton *publishButton;

@end

@implementation XYTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        //设置背景色
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
        //设置添加按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        
        publishButton.size = publishButton.currentBackgroundImage.size;
        
        [self addSubview:publishButton];
        self.publishButton = publishButton;
    }
    return self;
    
}
//重新布局
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    //设置发布按钮的坐标
    self.publishButton.center = CGPointMake(width/2, height/2);
    
    //设置其他UIBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width/5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    
    for (UIView *button in self.subviews) {
         if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        
        // 计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
    }
}

@end
