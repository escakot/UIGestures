//
//  SwipeViewController.m
//  UIGestures
//
//  Created by Errol Cheong on 2017-07-07.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet UIView *brownView;
@property (assign, nonatomic) BOOL isSwipedLeft;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isSwipedLeft = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)rightSwipe:(UISwipeGestureRecognizer *)sender {
    if (self.isSwipedLeft){
        CGPoint newCenter = CGPointMake(self.whiteView.center.x + 75, self.whiteView.center.y);
        self.whiteView.center = newCenter;
        self.isSwipedLeft = NO;
    }
}
- (IBAction)leftSwipe:(UISwipeGestureRecognizer *)sender {
    if (!self.isSwipedLeft){
        CGPoint newCenter = CGPointMake(self.whiteView.center.x - 75, self.whiteView.center.y);
        self.whiteView.center = newCenter;
        self.isSwipedLeft = YES;
    }
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
