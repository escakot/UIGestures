//
//  EdgePanViewController.m
//  UIGestures
//
//  Created by Errol Cheong on 2017-07-07.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "EdgePanViewController.h"

@interface EdgePanViewController ()

@property (strong, nonatomic) UIView* panView;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (strong, nonatomic) UIScreenEdgePanGestureRecognizer *edgeGesture;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property (assign, nonatomic) CGRect originalFrame;
@property (assign, nonatomic) CGRect pannedFrame;

@end

@implementation EdgePanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.width = 500;
    self.height = 500;
    
    self.originalFrame = CGRectMake(self.view.frame.size.width - 20, CGRectGetMidY(self.view.frame) - self.width/2, self.width, self.height);
    self.pannedFrame = CGRectMake(20, CGRectGetMidY(self.view.frame) - self.width/2, self.width, self.height);
    self.panView = [[UIView alloc] initWithFrame:self.originalFrame];
    self.panView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.panView];
    
    self.edgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanGesture:)];
    
    [self.edgeGesture setEdges:UIRectEdgeRight];
    self.edgeGesture.delegate = self;
    [self.panView addGestureRecognizer:self.edgeGesture];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    self.panGesture.delegate = self;
}

- (void)edgePanGesture:(UIScreenEdgePanGestureRecognizer*)sender{
    NSLog(@"Edge Gesture!!!");
    if (sender.state == UIGestureRecognizerStateChanged){
        CGPoint translationInView = [sender translationInView:self.view];
        CGPoint oldCenter = sender.view.center;
        CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y);
        
        sender.view.center = newCenter;
        [sender setTranslation:CGPointZero inView:self.view];
    }
    if (sender.state == UIGestureRecognizerStateEnded){
        NSLog(@"%f %f", self.panView.frame.origin.x, self.originalFrame.origin.x - 100);
        if (self.panView.frame.origin.x <= self.originalFrame.origin.x - 100){
            self.panView.frame = self.pannedFrame;
            [self.panView addGestureRecognizer:self.panGesture];
        } else {
            self.panView.frame = self.originalFrame;
        }
    }
    
}

- (void)panGesture:(UIPanGestureRecognizer*)sender{
    NSLog(@"Pan Gesture!!!");
    if (sender.state == UIGestureRecognizerStateChanged){
        CGPoint translationInView = [sender translationInView:self.view];
        CGPoint oldCenter = sender.view.center;
        CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y);
        
        sender.view.center = newCenter;
        [sender setTranslation:CGPointZero inView:self.view];
    }
    if (sender.state == UIGestureRecognizerStateEnded){
        if (self.panView.frame.origin.x >= 100){
            self.panView.frame = self.originalFrame;
            [self.panView removeGestureRecognizer:self.panGesture];
        } else {
            self.panView.frame = self.pannedFrame;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // You can customize the way in which gestures can work
    // Enabling multiple gestures will allow all of them to work together, otherwise only the topmost view's gestures will work (i.e. PanGesture view on bottom)
    return YES;
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
