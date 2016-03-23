//
//  JTViewController.m
//  JTToast
//
//  Created by luqyluqe on 11/22/2015.
//  Copyright (c) 2015 luqyluqe. All rights reserved.
//

#import "JTViewController.h"
#import "JTToast.h"

@interface JTViewController ()

@end

@implementation JTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    [[JTToast toastWithText:@"hahahahahahahahaha"] showInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
