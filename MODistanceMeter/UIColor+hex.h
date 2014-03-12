//
//  UIColor+hex.h
//  hafizOffline
//
//  Created by moath othman on 4/4/13.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (hex)

+ (UIColor *) colorFromHexString:(NSString *)hexString;
+(UIColor*)colorFromRGBValues:(NSString*)RGBString;
 
@end
