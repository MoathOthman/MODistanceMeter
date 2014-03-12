//
//  HelperMethods.h
//  Couponac
//
//  Created by moath othman on 9/4/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//




@interface HelperMethods : NSObject
+(NSString*)formattedNumber:(NSInteger)number;
+(void)hideTheTabBarView:(BOOL)shouldBeHidden animated:(bool)animated;
+ (void)processImageDataWithURLString:(NSURL *)url andBlock:(void (^)(NSData *imageData))processImage;



+(NSString*)RectifiedText:(NSString*)string;
//it has an alertView
+(BOOL)checkInternetConnection;
//
+ (void)postOnFaceBook;
//
+(BOOL)isInternetReachable;
//
+(bool)isRetinaDisplaySupported;
//----shadow layer for buttons
+ (CGPathRef)renderPaperCurl:(UIView*)imgView;
//----for ayat rectification to comfort with the quran plist
+(NSString*)RectifiedSourceText:(NSString*)string;
//..for debug
+(void)methodCallStack;
//---get plist content of quran plist file
+(NSDictionary*)getQuranDictionary:(NSString*)plistfilename;
//bezbo6 ll 7ake el englize bs
+(UIFont*) CustomFontWithSize:(NSString*)fontName size:(float)size;
//...shadowing
+(CALayer*)setOurSpecialShading:(UIView*)btn;
+(CALayer*)setOurSpecialShadingByreference:(UIView**)btn;
//splitter from dic
+(NSString*)getTheWord:(NSString*)line;
+(NSString*)getTheHokom:(NSString*)line;
//Animation
+ (void) attachPopUpAnimation:(UIView*)__view;
/*customFont*/
+(void)instantiateTextLayerWithFont:(NSString*)fontName;
+(void)addCustomLabelWithString:(NSString*)stringText overLabel:(UIView*)label fontSize:(int)fontSize;
+(void)addCustomLabelWithString:(NSString*)stringText overLabel:(UIView*)label fontSize:(int)fontSize withColor:(UIColor*)colorfore;
/*alertViews*/
+(void)showTimeOutAlertWithMessage:(NSString*)message inClass:(id)sender;


@end
