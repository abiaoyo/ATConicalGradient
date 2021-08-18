//
//  ATConicalGradientLayer.h
//  ATConicalGradientDemo
//
//  Created by liyebiao on 2021/8/3.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATConicalGradientLayer : CALayer

@property (nonatomic,strong) NSArray<UIColor *> * colors;
@property (nonatomic,strong) NSArray<NSNumber *> * locations;  //如果要使用需要跟colors.count数量一致
@property (nonatomic,assign) CGFloat startAngle;  //eg: 0.0 * M_PI / 180;
@property (nonatomic,assign) CGFloat endAngle;    //eg: 360.0 * M_PI / 180;
@property (nonatomic,assign) CGFloat offsetAngle;  //旋转颜色起始角度

@end

NS_ASSUME_NONNULL_END
