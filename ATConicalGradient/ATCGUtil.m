//
//  ATCGUtil.m
//  ATConicalGradientDemo
//
//  Created by liyebiao on 2021/8/3.
//

#import "ATCGUtil.h"

@implementation ATCGUtil

+ (double)convertWithValue:(double)value oldMin:(double)oldMin oldMax:(double)oldMax newMin:(double)newMin newMax:(double)newMax{
    double oldRange=0.0f,newRange=0.0f,newValue = 0.0f;
    oldRange = oldMax - oldMin;
    if(oldRange == 0.0f){
        newValue = newMin;
    }else{
        newRange = newMax - newMin;
        newValue = (((value - oldMin) * newRange) / oldRange) + newMin;
    }
    return newValue;
}

+ (double)convertWithValue:(double)value oldMax:(double)oldMax newMax:(double)newMax{
    return ((value * newMax) / oldMax);
}

+ (UIColor *)lerpFrom:(ATCG_RGBA)from to:(ATCG_RGBA)to percent:(CGFloat)percent{
    CGFloat red = from.red + percent * (to.red - from.red);
    CGFloat green = from.green + percent * (to.green - from.green);
    CGFloat blue = from.blue + percent * (to.blue - from.blue);
    CGFloat alpha = from.alpha + percent * (to.alpha - from.alpha);
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (ATCG_RGBA)atcg_rgbA:(UIColor *)color{
    ATCG_RGBA rgba;
    [color getRed:&rgba.red green:&rgba.green blue:&rgba.blue alpha:&rgba.alpha];
    return rgba;
}

@end
