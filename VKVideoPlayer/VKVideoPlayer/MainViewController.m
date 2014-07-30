//
//  MainMainMainViewController.m
//  RNFrostedSidebar
//
//  Created by Ryan Nystrom on 8/13/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "MainViewController.h"
#import "VKVideoPlayerViewController.h"

@interface MainViewController ()
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;
-(IBAction)dismissConfigView:(id)sender;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIViewController *viewController = [[VKVideoPlayerViewController alloc] init];
    [self presentModalViewController:viewController animated:YES];
    if ([viewController isKindOfClass:[VKVideoPlayerViewController class]]) {
        
        VKVideoPlayerViewController *videoController = (VKVideoPlayerViewController*)viewController;
        [videoController playVideoWithStreamURL:[NSURL URLWithString:@"http://localhost:12345/ios_240.m3u8"]];
    }


    //self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];
    
//    //guide to player
//    NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"VKVideoPlayerView" owner:(self) options:(nil)];
//    UIView *playerView=[nib objectAtIndex:0];
//    
//    playerView.frame=CGRectMake(0, 35, 310, 500);
//    
//    [self.view addSubview:playerView];
//   
//    //如何在view中添加控件，添加view等等
//    //[self.view ];
}

- (IBAction)onBurger:(id)sender {
    NSArray *images = @[
                        [UIImage imageNamed:@"gear"],
                        [UIImage imageNamed:@"globe"],
                        [UIImage imageNamed:@"profile"],
                        [UIImage imageNamed:@"star"],
                        [UIImage imageNamed:@"gear"],
                        [UIImage imageNamed:@"globe"],
                        [UIImage imageNamed:@"profile"],
                        [UIImage imageNamed:@"star"],
                        [UIImage imageNamed:@"gear"],
                        [UIImage imageNamed:@"globe"],
                        [UIImage imageNamed:@"profile"],
                        [UIImage imageNamed:@"star"],
                        ];
    NSArray *colors = @[
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        ];
    
    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices:self.optionIndices borderColors:colors];
//    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images];
    callout.delegate = self;
//    callout.showFromRight = YES;
    [callout show];
}


- (IBAction)dismissConfigView:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    NSLog(@"Tapped item at index %i",index);
    if (index == 0) {
        [self dismissModalViewControllerAnimated:YES];
   //     [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    if (index == 3) {
        [sidebar dismissAnimated:YES];
        
    }
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
    }
    else {
        [self.optionIndices removeIndex:index];
    }
}

@end
