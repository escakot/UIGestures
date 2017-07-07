//
//  TapViewController.m
//  UIGestures
//
//  Created by Errol Cheong on 2017-07-07.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = 100;
    CGFloat height = 100;
    
    UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame)-width/2, CGRectGetMidY(self.view.frame)-height/2, width, height)];
    tapView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:tapView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switchColorTapGesture:)];
    [tapView addGestureRecognizer:tapGesture];
}

- (void)switchColorTapGesture:(UITapGestureRecognizer*)sender{
//    if ([sender.view.backgroundColor isEqual:[UIColor greenColor]]){
//        sender.view.backgroundColor = [UIColor blueColor];
//    } else {
//        sender.view.backgroundColor = [UIColor greenColor];
//    }
    sender.view.backgroundColor = [sender.view.backgroundColor isEqual:[UIColor greenColor]] ? [UIColor blueColor] : [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
