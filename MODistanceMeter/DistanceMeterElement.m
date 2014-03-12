//
//  DistanceMeterElement.m
//  PullToRefresh
//
//  Created by moath othman on 9/3/13.
//
//

#import "DistanceMeterElement.h"
 @implementation DistanceMeterElement


- (void)createAndCustomTheNumberLabel:(CGRect)tFrame distancex:(NSString *)distancex {
    
    UILabel*numberLabel=[[UILabel alloc]initWithFrame:CGRectMake(0- 10, tFrame.origin.y-20, 24, 20)];
    if (distancex.integerValue==500) {
        distancex=@"500";
    }else     if (distancex.integerValue==0) {
        distancex=@"";
    }
    [numberLabel setText: distancex ];
    [numberLabel setTextColor:[UIColor whiteColor]];
    [numberLabel setBackgroundColor:[UIColor clearColor]];
    [numberLabel setFont:[UIFont fontWithName:@"Arial" size:12]];
    [numberLabel setClipsToBounds:NO];
    [numberLabel setTextAlignment:NSTextAlignmentCenter];
    [numberLabel setAutoresizesSubviews:YES];
    [numberLabel setAdjustsFontSizeToFitWidth:YES];
    [self addSubview:numberLabel];
}

-(id)initWithNumber:(NSNumber*)number anddistance:(NSString*)distancex{
    self=[super init ];
    
         
    UIImageView *distanceMeterImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:__distance_meter_img]];
    //distanceMeterImageView.hidden=YES;
    CGRect tFrame=distanceMeterImageView.frame;
    tFrame.origin.y=self.bounds.size.height-tFrame.size.height;
    
    
    
    float XPoint=(number.floatValue)*tFrame.size.width;

    [distanceMeterImageView setFrame:tFrame];
    
    [self addSubview:distanceMeterImageView];
    
    //number label creation
    [self createAndCustomTheNumberLabel:tFrame distancex:distancex];
    
         
    [self setFrame:CGRectMake(XPoint+centerXPint-tFrame.size.width, 45, tFrame.size.width, tFrame.size.height+10)];
 
    if ([distancex isEqualToString:@""]) {
        self.alpha=.73;
    }
    
    return self;
}


@end
