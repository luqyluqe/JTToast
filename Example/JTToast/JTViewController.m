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
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    UITapGestureRecognizer* tapRecog=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showToast)];
    [self.view addGestureRecognizer:tapRecog];
}

-(void)showToast
{
    [[JTToast toastWithText:@"hahahahahahahahaha"] show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
