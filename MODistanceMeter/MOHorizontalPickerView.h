//
//  MOHorizontalPickerView.h
//  Couponac
//
//  Created by moath othman on 9/2/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "UIView+rect.h"





@protocol MOHorizontalScrollerDelegate <NSObject>

-(void)didFinishScrollingWithValue:(NSNumber*)value;

@end
@interface MOHorizontalPickerView : UIView
@property(nonatomic,assign)id<MOHorizontalScrollerDelegate> horizontalScrollerDelegate;
@end
