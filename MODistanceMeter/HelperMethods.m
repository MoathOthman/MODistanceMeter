//
//  HelperMethods.m
//  Couponac
//
//  Created by moath othman on 9/4/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "HelperMethods.h"

@implementation HelperMethods


+(NSString*)formattedNumber:(NSInteger)number;
{
    NSMutableString*tempNumber=[NSMutableString stringWithFormat:@"%li",(long)number];
         NSRange rangeOfTheLastZeros=NSMakeRange(tempNumber.length-3, 3);
          [tempNumber replaceOccurrencesOfString:@"000" withString:@"" options:NSCaseInsensitiveSearch range:rangeOfTheLastZeros];
    if (number==1500){
        return @"1.5";
    }else if (number==2500){
        return @"2.5";
    }
    return tempNumber;
}
 

@end
