
//
//  FourthViewController.m
//  Notification&KVO
//
//  Created by Frank Chen on 2019-05-12.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "FourthViewController.h"
#import "CustomView.h"

@interface FourthViewController ()
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet CustomView *whiteView;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.whiteView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panning:)];
    [self.whiteView addGestureRecognizer:panGesture];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"change %@", change);
    if ([keyPath isEqualToString:@"point"]) {
        id value = change [NSKeyValueChangeNewKey];
        NSLog(@"val %@", value);
        NSValue* valueCast = (NSValue*) value;
        CGPoint point = valueCast.CGPointValue;
        
        NSLog(@"point %@", NSStringFromCGPoint(point));
        
        CGFloat yellowX = self.yellowView.center.x;
        CGFloat yellowY = self.yellowView.center.y;
        
        NSLog(@"yellow x %f", yellowX);
        NSLog(@"yellow y %f", yellowY);
        
        yellowX += point.x;
        yellowY += point.y;
        
        CGPoint newCenter = CGPointMake(yellowX, yellowY);
        self.yellowView.center = newCenter;
    }
}

-(void)panning:(UIPanGestureRecognizer*)sender{
    self.whiteView.point = [sender translationInView:self.view];
    [sender setTranslation:CGPointZero inView:self.view];
}

@end
