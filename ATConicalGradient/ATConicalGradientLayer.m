//
//  ATConicalGradientLayer.m
//  ATConicalGradientDemo
//
//  Created by liyebiao on 2021/8/3.
//

#import "ATConicalGradientLayer.h"
#import "ATCGUtil.h"

static double ATConicalGradientConstants_MaxAngle = M_PI * 2;
static double ATConicalGradientConstants_MaxHue = 255.0;


@interface ATCGTransition : NSObject
@property (nonatomic,assign) CGFloat fromLocation;
@property (nonatomic,assign) CGFloat toLocation;
@property (nonatomic,strong) UIColor * fromColor;
@property (nonatomic,strong) UIColor * toColor;
@end

@implementation ATCGTransition
- (UIColor *)colorForPercent:(CGFloat)percent{
    double normalizedPercent = [ATCGUtil convertWithValue:percent oldMin:self.fromLocation oldMax:self.toLocation newMin:0.0 newMax:1.0];
    return [ATCGUtil lerpFrom:[ATCGUtil atcg_rgbA:self.fromColor] to:[ATCGUtil atcg_rgbA:self.toColor] percent:normalizedPercent];
}
@end

@interface ATConicalGradientLayer()
@property (nonatomic,strong) NSMutableArray<ATCGTransition *> * transitions;
@end

@implementation ATConicalGradientLayer

- (instancetype)init{
    self = [super init];
    if (self) {
        _startAngle = 0.0f;
        _endAngle = ATConicalGradientConstants_MaxAngle;
        _transitions = [NSMutableArray new];
        _locations = [NSArray new];
        _colors = [NSArray new];
    }
    return self;
}


- (void)setColors:(NSArray<UIColor *> *)colors{
    _colors = colors;
    [self setNeedsDisplay];
}

- (void)setLocations:(NSArray<NSNumber *> *)locations{
    _locations = locations;
    [self setNeedsDisplay];
}

- (void)setStartAngle:(CGFloat)startAngle{
    _startAngle = startAngle;
    [self setNeedsDisplay];
}

- (void)setEndAngle:(CGFloat)endAngle{
    _endAngle = endAngle;
    [self setNeedsDisplay];
}

- (void)drawInContext:(CGContextRef)ctx{
    UIGraphicsPushContext(ctx);
    [self drawRect:CGContextGetClipBoundingBox(ctx)];
    UIGraphicsPopContext();
}

- (void)drawRect:(CGRect)rect{
    [self loadTransitions];
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGFloat longerSide = MAX(rect.size.width,rect.size.height);
    CGFloat radius = longerSide * sqrt(2);
    CGFloat step = (M_PI/2)/radius;
    CGFloat angle = self.startAngle;
    
    while (angle <= self.endAngle) {
        CGFloat pointX = radius * cos(angle+self.offsetAngle) + center.x;
        CGFloat pointY = radius * sin(angle+self.offsetAngle) + center.y;
        CGPoint startPoint = CGPointMake(pointX, pointY);
        
        UIBezierPath * line = [UIBezierPath bezierPath];
        [line moveToPoint:startPoint];
        [line addLineToPoint:center];
        
        UIColor * color = [self colorForAngle:angle];
        [color setStroke];
        [line stroke];
        
        angle += step;
    }
}

- (UIColor *)colorForAngle:(CGFloat)angle{
    CGFloat percent = [ATCGUtil convertWithValue:angle oldMax:ATConicalGradientConstants_MaxAngle newMax:1.0];
    
    ATCGTransition * transition = [self transitionForPercent:percent];
    if(!transition){
        return [self spectrumColorForAngle:angle];
    }
    UIColor * color = [transition colorForPercent:percent];
    return color;
}

- (UIColor *)spectrumColorForAngle:(CGFloat)angle{
    double hue = [ATCGUtil convertWithValue:angle oldMax:ATConicalGradientConstants_MaxAngle newMax:ATConicalGradientConstants_MaxHue];
    return [UIColor colorWithHue:(hue/ATConicalGradientConstants_MaxHue) saturation:1.0 brightness:1.0 alpha:1.0];
}

- (void)loadTransitions{
    [self.transitions removeAllObjects];
    
    if(self.colors.count > 1){
        NSUInteger transitionsCount = self.colors.count - 1;
        CGFloat locationStep = 1.0 / transitionsCount;
        for(NSUInteger i = 0; i<transitionsCount; i++){
            CGFloat fromLocation, toLocation;
            UIColor * fromColor = nil;
            UIColor * toColor = nil;
            
            if(self.locations.count == self.colors.count){
                fromLocation = self.locations[i].floatValue;
                toLocation = self.locations[i+1].floatValue;
            }else{
                fromLocation = locationStep * i;
                toLocation = locationStep * (i + 1);
            }
            fromColor = self.colors[i];
            toColor = self.colors[i+1];
            
            ATCGTransition * transition = [[ATCGTransition alloc] init];
            transition.fromLocation = fromLocation;
            transition.toLocation = toLocation;
            transition.fromColor = fromColor;
            transition.toColor = toColor;
            [self.transitions addObject:transition];
        }
    }
}

- (ATCGTransition *)transitionForPercent:(CGFloat)percent{
    NSMutableArray * filterd = [NSMutableArray new];
    for(ATCGTransition * trans in self.transitions){
        if(percent >= trans.fromLocation && percent < trans.toLocation){
            [filterd addObject:trans];
        }
    }
    ATCGTransition * defaultTransition = percent <= 0.5f ? self.transitions.firstObject : self.transitions.lastObject;
    return filterd.firstObject ?:defaultTransition;
}

@end
