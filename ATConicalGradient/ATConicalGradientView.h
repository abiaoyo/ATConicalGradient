//
//  ATConicalGradientView.h
//  ATConicalGradientDemo
//
//  Created by liyebiao on 2021/8/3.
//  From Github:https://github.com/tadija/AEConicalGradient
//

#import <UIKit/UIKit.h>
#import "ATConicalGradientLayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATConicalGradientView : UIView

@property (nonatomic,strong,readonly) ATConicalGradientLayer * gradient;

@end

NS_ASSUME_NONNULL_END
