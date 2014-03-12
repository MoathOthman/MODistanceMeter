//
//  MOHorizontalPickerView.m
//  Couponac
//
//  Created by moath othman on 9/2/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
// issue#4,#42

#import "MOHorizontalPickerView.h"
 #import "DistanceMeterScroller.h"
#import <QuartzCore/QuartzCore.h>

@interface MOHorizontalPickerView ()<DistanceMeterDelegate>

@end

 @implementation MOHorizontalPickerView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setupSubViews];
        
        
         
    }
    return self;
}



- (void )positionTheNeedle {
    /*position the needle in the middle*/
    UIImageView *redLineInMiddle=[[UIImageView alloc]initWithImage: [UIImage imageNamed:$needle]];
    [redLineInMiddle setXPoint:centerXPint];
    [redLineInMiddle setYPoint:12];
    [redLineInMiddle setWidth:3];
    [redLineInMiddle setHeight:70/2];
    
    [self addSubview:redLineInMiddle];
     
}

-(void)setupSubViews{
    [self setBackgroundColor:[UIColor colorFromHexString:outletTintColor]];
    //distance meter
    [self creatingTheLongGradientStrip];
   //needle
    [self positionTheNeedle];
       
        
}

-(void)creatingTheLongGradientStrip{
    
    
         DistanceMeterScroller *element=[[DistanceMeterScroller alloc]initWithFrame:CGRectMake(0, 0, 320, fixedHeight) AndMaximumDistance:100000];
         element.meterDelegate=self;
         [self addSubview:element];
    
    
}



#pragma mark distance meter delegate 

-(void)didFinishScrollingWithValue:(NSInteger)distance_{
    if (_horizontalScrollerDelegate &&[_horizontalScrollerDelegate respondsToSelector:@selector(didFinishScrollingWithValue:)]) {
        
        [_horizontalScrollerDelegate didFinishScrollingWithValue:[NSNumber numberWithInteger:distance_]];
    }
}
@end
