//
//  ViewController.m
//  MODistanceMeter
//
//  Created by moath othman on 3/12/14.
//  Copyright (c) 2014 moath othman. All rights reserved.
//

#import "ViewController.h"
#import "MOHorizontalPickerView.h"
@interface ViewController ()<MOHorizontalScrollerDelegate>
{
    MOHorizontalPickerView *_horizontalPicker;

}
@end
#define heightOfHorizontalPicker 47

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTheHorizontalPicker];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupTheHorizontalPicker {
    /*MOHorizontalPickerView Setup*/
    
    _horizontalPicker=[MOHorizontalPickerView new];
    _horizontalPicker.horizontalScrollerDelegate=self;
    [_horizontalPicker setFrame:CGRectMake(0, 20, 320, heightOfHorizontalPicker)];
    
    
    [self.view addSubview:_horizontalPicker];
    [self.view bringSubviewToFront:_horizontalPicker];
    
    
    
    
}

#pragma mark MoHorizontal Pscroller Delegate
-(void)didFinishScrollingWithValue:(NSNumber *)value{
    _distanceLabel.text =[NSString stringWithFormat:@"%@m",[value stringValue]];
    NSLog(@"value is %li",(long)value.integerValue);
}


@end
