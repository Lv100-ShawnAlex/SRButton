//
//  SRButton.m
//  SRButton
//
//  Created by ShawnRufus on 2022/4/11.
//

#import "SRButton.h"

@implementation SRButton

// 判断点击是否在当前视图方法
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    // 判断当前视图是开启交互, 是否隐藏, 透明度小于0.01
    if (!self.userInteractionEnabled ||
        [self isHidden] ||
        self.alpha <= 0.01){
        
        // 当前view不响应点击事件
        return nil;
        
    }
    
    
    // 判断点击位置是否在当前视图范围内
    if ([self pointInside:point withEvent:event]){
        
        // 设置一个初始视图
        __block UIView *hitView = nil;
        
        // 遍历子视图
        // NSEnumerationReverse 倒序
        
        [self.subviews enumerateObjectsWithOptions: NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CGPoint p = [self convertPoint:point toView:obj];
            
            hitView = [obj hitTest:p withEvent:event];
            
            if (hitView) {
                *stop = YES;
            }
            
        }];
        
        if (hitView){
            return  hitView;
        }
        
        return self;
        
    }
    
    // 点击区域不在范围内返回nil
    return nil;
}

// 判断当前点击区域是否在范围内
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    // 获取当前点坐标
    CGFloat x1 = point.x;
    CGFloat y1 = point.y;
    
    // 按钮中心点坐标
    CGFloat x2 = CGRectGetWidth(self.frame) / 2;
    CGFloat y2 = CGRectGetHeight(self.frame) / 2;
    
    
    // 计算2个点之间的距离
    double d = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    
    // 判断点击位置是否在范围内
    // 20: 是我这边设置个随意的边界差值, 便于观察, 根据自己需求设置
    if (d < CGRectGetWidth(self.frame) / 2  - 20){
        return YES;
    }
    
    
    return NO;
}

@end
