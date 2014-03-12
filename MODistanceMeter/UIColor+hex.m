//
//  UIColor+hex.m
//  hafizOffline
//
//  Created by moath othman on 4/4/13.
//
//

#import "UIColor+hex.h"

@implementation UIColor (hex)
+ (UIColor *) colorFromHexString:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+(UIColor*)colorFromRGBValues:(NSString*)RGBString;
{
    
    NSArray  *RGBArray =[RGBString componentsSeparatedByString:@","];
    
    int R=[[RGBArray objectAtIndex:0]floatValue];
    int G=[[RGBArray objectAtIndex:1]floatValue];
    int B=[[RGBArray objectAtIndex:2]floatValue];

    
    UIColor *color =[UIColor colorWithRed:R  green:G blue:B  alpha:.9];
    
    return color;
}
@end
