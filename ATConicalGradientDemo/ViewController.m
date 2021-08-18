//
//  ViewController.m
//  ATConicalGradientDemo
//
//  Created by liyebiao on 2021/8/3.
//

#import "ViewController.h"
#import "ATConicalGradientView.h"
@interface ViewController ()
@property (nonatomic,strong) ATConicalGradientView * gradientView;
@property (nonatomic,strong) ATConicalGradientView * gradientView2;
@property (nonatomic,strong) ATConicalGradientView * gradientView3;
@property (nonatomic,strong) ATConicalGradientView * gradientView4;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ATConicalGradientView * view = [[ATConicalGradientView alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
    view.backgroundColor = UIColor.grayColor;
    view.gradient.startAngle = 0.0 * M_PI / 180;
    view.gradient.endAngle = 360.0 * M_PI / 180;
    [self.view addSubview:view];
    view.gradient.colors = @[UIColor.purpleColor,UIColor.blueColor,UIColor.greenColor,UIColor.yellowColor,UIColor.orangeColor,UIColor.purpleColor];
    self.gradientView = view;
    
    view = [[ATConicalGradientView alloc] initWithFrame:CGRectMake(20, 420, 300, 300)];
    view.backgroundColor = UIColor.grayColor;
    view.gradient.startAngle = 0.0 * M_PI / 180;
    view.gradient.endAngle = 360.0 * M_PI / 180;
    view.gradient.offsetAngle = 0.4;
    [self.view addSubview:view];
    view.gradient.colors = @[UIColor.purpleColor,UIColor.blueColor,UIColor.greenColor,UIColor.yellowColor,UIColor.orangeColor,UIColor.purpleColor];
    self.gradientView2 = view;
    
    UIButton * changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeButton setTitle:@"Change" forState:UIControlStateNormal];
    changeButton.frame = CGRectMake(20, 480, 100, 40);
    changeButton.backgroundColor = UIColor.orangeColor;
    [changeButton addTarget:self action:@selector(clickChange) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
    
}

- (void)clickChange{
    NSLog(@"clickChange");
    self.gradientView.gradient.colors = @[UIColor.purpleColor,UIColor.blueColor,UIColor.greenColor,UIColor.yellowColor,UIColor.orangeColor,UIColor.purpleColor];
    self.gradientView2.gradient.colors = @[UIColor.purpleColor,UIColor.blueColor,UIColor.greenColor,UIColor.yellowColor,UIColor.orangeColor,UIColor.purpleColor];
}


@end
