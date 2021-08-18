//
//  ATConicalGradientView.m
//  ATConicalGradientDemo
//
//  Created by liyebiao on 2021/8/3.
//

#import "ATConicalGradientView.h"

@implementation ATConicalGradientView

+ (Class)layerClass{
    return ATConicalGradientLayer.class;
}

- (ATConicalGradientLayer *)gradient{
    return (ATConicalGradientLayer *)self.layer;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    self.layer.contentsScale = UIScreen.mainScreen.scale;
    self.layer.drawsAsynchronously = YES;
    self.layer.needsDisplayOnBoundsChange = YES;
    [self.layer setNeedsDisplay];
}



@end
