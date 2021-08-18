//
//  ATCGUtil.h
//  ATConicalGradientDemo
//
//  Created by liyebiao on 2021/8/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

struct ATCG_RGBA {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
};

typedef struct ATCG_RGBA ATCG_RGBA;


@interface ATCGUtil : NSObject

+ (double)convertWithValue:(double)value oldMin:(double)oldMin oldMax:(double)oldMax newMin:(double)newMin newMax:(double)newMax;
+ (double)convertWithValue:(double)value oldMax:(double)oldMax newMax:(double)newMax;

+ (UIColor *)lerpFrom:(ATCG_RGBA)from to:(ATCG_RGBA)to percent:(CGFloat)percent;
+ (ATCG_RGBA)atcg_rgbA:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
