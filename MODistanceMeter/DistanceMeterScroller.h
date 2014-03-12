//
//  DistanceMeterScroller.h
//  PullToRefresh
//
//  Created by moath othman on 9/3/13.
//
//

#import "DistanceMeterElement.h"


@protocol DistanceMeterDelegate <NSObject>

-(void)didFinishScrollingWithValue:(NSInteger)distance_;

@end
@interface DistanceMeterScroller : UIScrollView<UIScrollViewDelegate>

- (id)initWithFrame:(CGRect)frame AndMaximumDistance:(NSInteger)maximamumDistance;
@property(nonatomic,assign,readonly)int maximumDistance;
@property(nonatomic,assign,readonly)int latestDistance;
@property(nonatomic,strong)id <DistanceMeterDelegate>meterDelegate;
@end
