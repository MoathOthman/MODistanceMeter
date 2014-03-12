//
//  ScrollerCalculator.h
//  Couponac
//
//  Created by moath othman on 9/5/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "MacrosForHorizontalPicker.h"
#import "HelperMethods.h"

NS_INLINE NSInteger numberOfElementsGivenDitance ( NSInteger mdistance_){
    return ((mdistance_/distance2)+1+(3000)/distance);
}


NS_INLINE NSInteger calCulateMaxWidthOfTheScroller(NSInteger maxdistance){
    
    UIImageView *ima=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"distance_meter"]];
    
    NSInteger maxW=ima.frame.size.width*(numberOfElementsGivenDitance(maxdistance)+margin*2.5);
    
    return maxW;
}


NS_INLINE NSString* numberToDistanceCalculator ( int numberId , int max){
    
    int firstDelimiter=3000/distance ;
    int secondDelemiter=firstDelimiter+1 ;
    NSInteger result;
    if (numberId<0 || numberId>=max) {
        return @"";
    }
    if (numberId<=firstDelimiter) {
        result= numberId*distance;
    }else if (numberId<=secondDelemiter){
        result= (numberId-1)*distance+distance1;//10000
    }else{
        result= ((numberId+1)-7)*distance2;
    }
    return [HelperMethods formattedNumber:result];
}


 