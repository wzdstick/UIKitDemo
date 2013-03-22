//
//  MTViewController.m
//  UIKitDemo
//
//  Created by C. A. Beninati on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MTViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MTViewController () {
    NSArray *imagesArray;
    NSArray *titlesArray;
}

@end

@implementation MTViewController
@synthesize aNavigationBar;
@synthesize anImageView;
@synthesize aLabel;
@synthesize aSegmentControl;

- (void)setupUI {
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BG-pattern.png"]]];
    
    [anImageView.layer setBorderWidth:5.0f];
    [anImageView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [anImageView.layer setShadowRadius:5.0f];
    [anImageView.layer setShadowOpacity:.85f];
    [anImageView.layer setShadowOffset:CGSizeMake(1.0f, 2.0f)];
    [anImageView.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [anImageView.layer setShouldRasterize:YES];
    [anImageView.layer setMasksToBounds:NO];
    
    [aLabel.layer setCornerRadius:15.0f];
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(.03f);
    anImageView.transform = transform;
    
    UIImage *navBarImage = [UIImage imageNamed:@"navBar.png"];
    [[UINavigationBar appearance] setBackgroundImage:navBarImage forBarMetrics:UIBarMetricsDefault];
    
    UIImage *segmentSelected = [[UIImage imageNamed:@"segcontrol_sel.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
    UIImage *segmentUnselected = [[UIImage imageNamed:@"segcontrol_uns.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
    UIImage *segmentSelectedUnselected = [UIImage imageNamed:@"segcontrol_sel-uns.png"];
    UIImage *segUnselectedSelected = [UIImage imageNamed:@"segcontrol_uns-sel.png"];
    UIImage *segmentUnselectedUnselected = [UIImage imageNamed:@"segcontrol_uns-uns.png"];
    
    [[UISegmentedControl appearance] setBackgroundImage:segmentUnselected
                                               forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setBackgroundImage:segmentSelected
                                               forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setDividerImage:segmentUnselectedUnselected
                                 forLeftSegmentState:UIControlStateNormal
                                   rightSegmentState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setDividerImage:segmentSelectedUnselected
                                 forLeftSegmentState:UIControlStateSelected
                                   rightSegmentState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setDividerImage:segUnselectedSelected
                                 forLeftSegmentState:UIControlStateNormal
                                   rightSegmentState:UIControlStateSelected
                                          barMetrics:UIBarMetricsDefault];
}

- (void)setupData {
    imagesArray = [NSArray arrayWithObjects:@"red_rocks.jpg", @"tree.jpg", @"truck.jpg", nil];
    titlesArray = [NSArray arrayWithObjects:@"Red Rocks", @"A Tree", @"A Truck", nil];
}

- (void)viewDidLoad
{
    // set up the custom UI elements
    [self setupUI];
    
    // build arrays for images and titles
    [self setupData];
        
    // start app with first segment selected
    [self didChangeSegmentControl:aSegmentControl];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setANavigationBar:nil];
    [self setAnImageView:nil];
    [self setALabel:nil];
    [self setASegmentControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)didChangeSegmentControl:(UISegmentedControl*)sender {
    [anImageView setImage:[UIImage imageNamed:[imagesArray objectAtIndex:[sender selectedSegmentIndex]]]];
    
    [aLabel setText:[titlesArray objectAtIndex:[sender selectedSegmentIndex]]];
}
@end
