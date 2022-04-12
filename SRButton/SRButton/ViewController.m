//
//  ViewController.m
//  SRButton
//
//  Created by ShawnRufus on 2022/4/11.
//

#import "ViewController.h"
#import "SRButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    SRButton *btn = [[SRButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    btn.backgroundColor = UIColor.blackColor;
    [btn setTitle:@"Click Me" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(SRBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)SRBtnClick {
    
    NSLog(@"Test");
}

@end
