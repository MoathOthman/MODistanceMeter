//
//  DistanceMeterScroller.m
//  PullToRefresh
//
//  Created by moath othman on 9/3/13.
//
//

#import "DistanceMeterScroller.h"
#import "ScrollerCalculator.h"
@implementation DistanceMeterScroller{
    float widthOfEachElement;
    NSMutableArray *containedElements;
 }
 
- (void)somePropertiesSetupForTheScroller
{
    // Initialization code
    self.delegate=self;
    [self setBounces:YES];
    [self setScrollEnabled:YES];
    [self setShowsVerticalScrollIndicator:NO];
    [self setShowsHorizontalScrollIndicator:NO];
    [self setAlwaysBounceVertical:NO];
  //  [self setBackgroundColor:[UIColor clearColor]];
    [self setContentSize:CGSizeMake( calCulateMaxWidthOfTheScroller(_maximumDistance)-42, fixedHeight)];
}

- (id)initWithFrame:(CGRect)frame AndMaximumDistance:(NSInteger)maximamumDistance
{
    self = [super initWithFrame:frame];
    
    if (self) {
        containedElements=[NSMutableArray new];
         _maximumDistance=maximamumDistance;
        [self creatingTheLongGradientStrip];
        [self somePropertiesSetupForTheScroller];

        
        [self setAccessibilityIdentifier:@"horizontalScroll"];
        [self setAccessibilityLabel:@"HScroll"];
       }
    return self;
}
 
-(void)creatingTheLongGradientStrip{
   
   // NSLog(@"number of elements are %i",numberOfElementsGivenDitance(_maximumDistance));
    
    NSInteger numberElements=numberOfElementsGivenDitance(_maximumDistance);
     for (int i =0-margin; i<numberElements +margin; i+=1) {
       
        DistanceMeterElement *element=[[DistanceMeterElement alloc]initWithNumber:[NSNumber numberWithInt:i ] anddistance:numberToDistanceCalculator(i,numberElements)];
         [containedElements addObject:element];
         element.tag=i;
         [self addSubview:element];
    }
    
    
}


#pragma mark ScrollView Delegate
 
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
     if (!decelerate) {
        
        [self calculateThePositionOfTheSelectedElement];
    }
}

 
- (void)calculateThePositionOfTheSelectedElement {
    //tempREct is the frame of the needle 
    CGRect tempREct=CGRectMake(self.contentOffset.x+centerXPint, self.contentOffset.y, 5, fixedHeight);
    
    [containedElements enumerateObjectsUsingBlock:^(DistanceMeterElement* element, NSUInteger idx, BOOL *stop) {
        if (CGRectIntersectsRect(tempREct, element.frame)) {
            float valueForEachPxInBetween=0;
            float contentOffset=self.contentOffset.x;
             if (element.tag<6) {

                _latestDistance=( self.contentOffset.x);//will give us the exact point
                 valueForEachPxInBetween=500/25;
                _latestDistance*=500/25; //we have 25 px width and 500 distance
                _latestDistance+=(element.tag)*distance-(distance*(element.tag-1));
                 _latestDistance=ceilf(_latestDistance);
                 
            }else if (element.tag==6){ // number 3 /3000 m
                 valueForEachPxInBetween=7000/25;
                _latestDistance =3000+(valueForEachPxInBetween*(contentOffset-125));
                //125 is the content offset of the latest point in element 5 
                _latestDistance=ceilf(_latestDistance) ;
            }else{
                int ctag=((element.tag+1)-7);
                _latestDistance=( self.contentOffset.x);//will give us the exact point
                valueForEachPxInBetween=distance2/25;
                 _latestDistance+=distance2*ctag+( (valueForEachPxInBetween*(contentOffset-(125+(25 *ctag)))));
                _latestDistance=ceilf(_latestDistance);
                
            }
           
            //Send the value with NotificationCenter
            
            
            if (_meterDelegate &&[_meterDelegate respondsToSelector:@selector(didFinishScrollingWithValue:)]) {
                [_meterDelegate didFinishScrollingWithValue:_latestDistance];
            }
            
            *stop=YES;

        }
    }];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
     
    [self calculateThePositionOfTheSelectedElement];
  
}
 

@end
