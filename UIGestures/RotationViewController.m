//
//  RotationViewController.m
//  UIGestures
//
//  Created by Errol Cheong on 2017-07-07.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = 100;
    CGFloat height = 100;
    
    UIView *rotationView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame)-width/2, CGRectGetMidY(self.view.frame)-height/2, width, height)];
    rotationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:rotationView];
    
    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGesture:)];
    [rotationView addGestureRecognizer:rotateGesture];
    
}

- (void)rotationGesture:(UIRotationGestureRecognizer*)sender{
    sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation);
    sender.rotation = 0.0;
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
