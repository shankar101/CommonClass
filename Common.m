//
//  Common.m
//
//  Created by Shankar Mallick on 13/05/13.
//  Copyright (c) 2013 shankarm_ios. All rights reserved.
//

#import "Common.h"
#import <QuartzCore/QuartzCore.h>


NSString *const kUIActivityIndicatorView = @"UIActivityIndicatorView";
NSString *const kTJActivityIndicator = @"TJActivityIndicator";
NSString *const kTJCircularSpinner = @"TJCircularSpinner";
NSString *const kTJBeachBallSpinner = @"TJBeachBallSpinner";
#define timeFormat1                      @"hh:mm a"
#define dateFormatForChat               @"MMM dd, yyyy"
#define dateFormatForConvrList          @"MM-dd-yyyy"
#define dateFormatForGMT                @"yyyy-MM-dd HH:mm:ss"
#define onlyDateFormatForGMT            @"yyyy-MM-dd"
static Common *common;

@implementation Common

@synthesize _where;
@synthesize _frWhichApiCll;
@synthesize queueCount;
@synthesize queue;
@synthesize backgroundQueue;
@synthesize isDatabaseBusy;
@synthesize isPanelActive;
@synthesize isFromLogIn;
@synthesize isFromAboutUs;
@synthesize isFromSplash;
@synthesize isUserLoggingOut;
@synthesize cityLatLong;
@synthesize placeName;
//@synthesize customSpinner;
@synthesize rectAnnotation;
@synthesize offsetHeight1;
@synthesize offsetHeight2;

+(Common *)SharedInstance
{
    static Common *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        sharedManager.queue = [[NSOperationQueue alloc] init];
        [sharedManager.queue setMaxConcurrentOperationCount:1];
        sharedManager.appDelegate = (RLAppDelegate *)[[UIApplication sharedApplication] delegate];
        sharedManager.backgroundQueue = dispatch_queue_create("Rowlout_Queue", NULL);
    });
    return sharedManager;
}

-(void)insertIntoQueue:(NSInvocationOperation *)_operation
{
    [self.queue addOperation:_operation];
    self.queueCount--;
    
    if(self.queueCount<1)
        self.queueCount = 1;
}

- (NSString *)getNibName:(NSString *)OriginalnibName
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return [NSString stringWithFormat:@"%@_iPad",OriginalnibName];
    }
    else
    {
        return [NSString stringWithFormat:@"%@_iPhone",OriginalnibName];
    }
}

-(NSString *)GetCurrentDate
{
    NSDate *dt = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [df stringFromDate:dt];
    return strDate;
}

#pragma mark Loading
-(void)startLoadingWithMessage:(NSString*)massage onView:(id)_view
{
    [SVProgressHUD dismiss];
    [SVProgressHUD show];
}

-(void)stopLoading_onView:(id)_view
{
    [SVProgressHUD dismiss];
}

-(NSString *)ReplaceSpecialCharacter:(NSString *)_str
{
    _str=  [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[_str stringByReplacingOccurrencesOfString:@"\n\r" withString:@"%0A"] stringByReplacingOccurrencesOfString:@"\n" withString:@"%0D"] stringByReplacingOccurrencesOfString:@"<" withString:@"%8B"] stringByReplacingOccurrencesOfString:@">" withString:@"%9B"] stringByReplacingOccurrencesOfString:@"[" withString:@"%5B"] stringByReplacingOccurrencesOfString:@"]" withString:@"%5D"] stringByReplacingOccurrencesOfString:@"{" withString:@"%7B"] stringByReplacingOccurrencesOfString:@"}" withString:@"%7D"] stringByReplacingOccurrencesOfString:@"(" withString:@"%28"] stringByReplacingOccurrencesOfString:@")" withString:@"%29"] stringByReplacingOccurrencesOfString:@"`" withString:@"%60"]  stringByReplacingOccurrencesOfString:@";" withString:@"%3B"] stringByReplacingOccurrencesOfString:@"," withString:@"%2C"] stringByReplacingOccurrencesOfString:@"\"" withString:@"%5C"] stringByReplacingOccurrencesOfString:@"/" withString:@"%2F"]   stringByReplacingOccurrencesOfString:@"£" withString:@"%A3"]
                         stringByReplacingOccurrencesOfString:@"&" withString:@"%26"]
                        stringByReplacingOccurrencesOfString:@"'" withString:@"%27"]
                       stringByReplacingOccurrencesOfString:@"?" withString:@"%3F"]
                      stringByReplacingOccurrencesOfString:@"#" withString:@"%23"]
                     stringByReplacingOccurrencesOfString:@"$" withString:@"%24"]
                    stringByReplacingOccurrencesOfString:@"!" withString:@"%21"]
                   stringByReplacingOccurrencesOfString:@"^" withString:@"%5E"]
                  stringByReplacingOccurrencesOfString:@"*" withString:@"%2A"]
                 stringByReplacingOccurrencesOfString:@"_" withString:@"%5F"]
                stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"]
               stringByReplacingOccurrencesOfString:@"|" withString:@"%7C"]
              stringByReplacingOccurrencesOfString:@"=" withString:@"%3D"]
             stringByReplacingOccurrencesOfString:@"¢" withString:@"%A2"]
            stringByReplacingOccurrencesOfString:@"¥" withString:@"%A5"];
    _str=[_str stringByReplacingOccurrencesOfString:@"\r" withString:@"%0A"];
    
    return _str;
}


-(NSString *)OutPutReplaceSpecialCharacter:(NSString *)_str
{
    _str=[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[_str stringByReplacingOccurrencesOfString:@"%0A" withString:@"\n\r"] stringByReplacingOccurrencesOfString:@"%0D" withString:@"\n"] stringByReplacingOccurrencesOfString:@"%8B" withString:@"<"] stringByReplacingOccurrencesOfString:@"%9B" withString:@">"] stringByReplacingOccurrencesOfString:@"%5B" withString:@"["] stringByReplacingOccurrencesOfString:@"%5D" withString:@"]"] stringByReplacingOccurrencesOfString:@"%7B" withString:@"{"] stringByReplacingOccurrencesOfString:@"%7D" withString:@"}"] stringByReplacingOccurrencesOfString:@"%28" withString:@"("] stringByReplacingOccurrencesOfString:@"%29" withString:@")"] stringByReplacingOccurrencesOfString:@"%60" withString:@"`"]  stringByReplacingOccurrencesOfString:@"%3B" withString:@";"] stringByReplacingOccurrencesOfString:@"%2C" withString:@","] stringByReplacingOccurrencesOfString:@"%5C" withString:@"\""] stringByReplacingOccurrencesOfString:@"%2F" withString:@"/"]   stringByReplacingOccurrencesOfString:@"%A3" withString:@"£"]
                       stringByReplacingOccurrencesOfString:@"%26" withString:@"&"]
                      stringByReplacingOccurrencesOfString:@"%27" withString:@"'"]
                     stringByReplacingOccurrencesOfString:@"%3F" withString:@"?"]
                    stringByReplacingOccurrencesOfString:@"%23" withString:@"#"]
                   stringByReplacingOccurrencesOfString:@"%24" withString:@"$"]
                  stringByReplacingOccurrencesOfString:@"%21" withString:@"!"]
                 stringByReplacingOccurrencesOfString:@"%5E" withString:@"^"]
                stringByReplacingOccurrencesOfString:@"%2A" withString:@"*"]
               stringByReplacingOccurrencesOfString:@"%5F" withString:@"_"]
              stringByReplacingOccurrencesOfString:@"%2B" withString:@"+"]
             stringByReplacingOccurrencesOfString:@"|" withString:@"%7C"]
            stringByReplacingOccurrencesOfString:@"%3D" withString:@"="]
           stringByReplacingOccurrencesOfString:@"%A2" withString:@"¢"]
          stringByReplacingOccurrencesOfString:@"%A5" withString:@"¥"];
    _str=[_str stringByReplacingOccurrencesOfString:@"%0A" withString:@"\r"];
    
    return _str;
}

-(NSString *)ReplaceWhiteSpaces:(NSString *)_str
{
    _str = [_str stringByReplacingOccurrencesOfString:@" " withString:@""];
    _str = [_str stringByReplacingOccurrencesOfString:@"," withString:@""];
    _str = [_str stringByAppendingString:@"Icon"];
    return _str;
}

-(void)OpenRightPanelList_OnMenuClick
{
    
}

-(NSString *)BreakSecondsInto_Years_Months_Days_Hours_Minutes_Seconds:(int)secs
{
    int num_seconds = secs;
    int years = num_seconds / (60 * 60 * 24 * 30 * 365);
    num_seconds -= years * (60 * 60 * 24 * 30 * 365);
    int months = num_seconds / (60 * 60 * 24 * 30);
    num_seconds -= months * (60 * 60 * 24 * 30);
    int days = num_seconds / (60 * 60 * 24);
    num_seconds -= days * (60 * 60 * 24);
    int hours = num_seconds / (60 * 60);
    num_seconds -= hours * (60 * 60);
    int minutes = num_seconds / 60;
    num_seconds -= minutes * 60;
    
    NSString *str_Time = @"";
    
    str_Time = [NSString stringWithFormat:@"%02d:%02d:%02d ",hours,minutes,num_seconds];
    
    return str_Time;
}
-(NSString *)ReplaceStringwhenGetZero:(NSString *)_str
{
    
    
    _str=[_str stringByReplacingOccurrencesOfString:@"0" withString:@""];
    return _str;
    
    
}
-(BOOL)isiPhone5
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            CGFloat scale = [UIScreen mainScreen].scale;
            result = CGSizeMake(result.width * scale, result.height * scale);
            
            if(result.height == 960) {
                return NO;
            }
            if(result.height == 1136) {
                return YES;
            }
        }
        else{
            return NO;
        }
    }
    return NO;
}

-(BOOL)isiPad{
    return (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad);
}

-(BOOL)isiPadRetina
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            CGFloat scale = [UIScreen mainScreen].scale;
            result = CGSizeMake(result.width * scale, result.height * scale);
            
            if(result.height == 1024) {
                return NO;
            }
            if(result.height == 2048) {
                return YES;
            }
        }
        else{
            return NO;
        }
    }
    return NO;
}

-(BOOL)isiPhone
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}

-(BOOL)isiPhoneRetina
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            CGFloat scale = [UIScreen mainScreen].scale;
            result = CGSizeMake(result.width * scale, result.height * scale);
            
            if(result.height == 960) {
                return YES;
            }
            if(result.height == 1136) {
                return NO;
            }
        }
        else{
            return NO;
        }
    }
    return NO;
}

-(BOOL)validateEmail:(NSString *)Email
{
    if(Email.length==0)
        return NO;
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    //NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [emailTest evaluateWithObject:Email];
}

-(NSString *)NULLInputinitWithString:(NSString*)InputString {
    
    if( (InputString == nil) ||(InputString ==(NSString*)[NSNull null])||([InputString isEqual:nil])||([InputString length] == 0)||([InputString isEqualToString:@""])||([InputString isEqualToString:@"(NULL)"])||([InputString isEqualToString:@"<NULL>"])||([InputString isEqualToString:@"<null>"]||([InputString isEqualToString:@"(null)"])||([InputString isEqualToString:@"NULL"]) ||([InputString isEqualToString:@"null"])))
        
        return @"";
    else
        return InputString ;
}

-(void)ShowAlertWithMessage:(NSString *)AlertMessage
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kALERT_CAPTION message:AlertMessage delegate:nil cancelButtonTitle:kALERT_OK otherButtonTitles:nil];
    [alert show];
}

#pragma mark- UserDefaults Related

-(void)storObject:(NSString *)value forKeyPath:(NSString *)key
{
    if ([USER_DEFAULTS objectForKey:key]) {
        [USER_DEFAULTS removeObjectForKey:key];
    }
    [USER_DEFAULTS setObject:value forKey:key];
    [USER_DEFAULTS synchronize];
}

-(void)storBool:(BOOL)value forKeyPath:(NSString *)key
{
    [USER_DEFAULTS setBool:value forKey:key];
    [USER_DEFAULTS synchronize];
}

-(void)storInt:(int)value forKeyPath:(NSString *)key
{
    [USER_DEFAULTS setInteger:value forKey:key];
    [USER_DEFAULTS synchronize];
}

-(int)getIntForKeyPath:(NSString *)key
{
    return (int)[USER_DEFAULTS integerForKey:key];
}

-(BOOL)getBoolForKeyPath:(NSString *)key;
{
    return [USER_DEFAULTS boolForKey:key];
}

-(void)removeObjectForKey:(NSString *)key
{
    [USER_DEFAULTS removeObjectForKey:key];
    [USER_DEFAULTS synchronize];
}

-(NSString *)getValueForKeypath:(NSString *)key
{
    return [USER_DEFAULTS valueForKeyPath:key];
}


-(NSAttributedString *)GetPlaceholderColor:(UITextField *)txtField
{
    NSAttributedString *attr_str = nil;
   // UIFont *font=[UIFont fontWithName:@"OpenSans-Regular" size:15.0];
    if (IS_IPAD)
        attr_str = [[NSAttributedString alloc]
                    initWithString:txtField.placeholder attributes: // NOTE: textField.placeholder can't be nil
                    @{ NSForegroundColorAttributeName : [UIColor whiteColor],
                       NSFontAttributeName : [UIFont fontWithName:@"OpenSans" size:26.0] }];
    else
        attr_str = [[NSAttributedString alloc]
         initWithString:txtField.placeholder attributes: // NOTE: textField.placeholder can't be nil
         @{ NSForegroundColorAttributeName : [UIColor whiteColor],
            NSFontAttributeName : [UIFont fontWithName:@"OpenSans" size:14.0] }];
    return attr_str;
}
-(NSAttributedString *)GetPlaceholderColor4CreateEvent:(UITextField *)txtField
{
    NSAttributedString *attr_str = nil;
    // UIFont *font=[UIFont fontWithName:@"OpenSans-Regular" size:15.0];
    if (IS_IPAD)
        attr_str = [[NSAttributedString alloc]
                    initWithString:txtField.placeholder attributes: // NOTE: textField.placeholder can't be nil
                    @{ NSForegroundColorAttributeName : [UIColor colorWithRed:185.0/255.0 green:185.0/255.0 blue:185.0/255.0 alpha:1.0f],
                       NSFontAttributeName : [UIFont fontWithName:@"OpenSans" size:26.0] }];
    else
        attr_str = [[NSAttributedString alloc]
                    initWithString:txtField.placeholder attributes: // NOTE: textField.placeholder can't be nil
                    @{ NSForegroundColorAttributeName : [UIColor colorWithRed:185.0/255.0 green:185.0/255.0 blue:185.0/255.0 alpha:1.0f],
                       NSFontAttributeName : [UIFont fontWithName:@"OpenSans" size:14.0] }];
    return attr_str;
}
-(NSAttributedString *)GetPlaceholderColor_addWorkOrder:(UITextField *)txtField
{
    NSAttributedString *attr_str = nil;
    if (IS_IPAD)
        attr_str = [[NSAttributedString alloc]
                    initWithString:txtField.placeholder attributes: // NOTE: textField.placeholder can't be nil
                    @{ NSForegroundColorAttributeName : [UIColor colorWithRed:100.0/255.0 green:113.0/255.0 blue:127.0/255.0 alpha:1.0f],
                       NSFontAttributeName : [UIFont fontWithName:@"OpenSans" size:26.0] }];
    else
        attr_str = [[NSAttributedString alloc]
                    initWithString:txtField.placeholder attributes: // NOTE: textField.placeholder can't be nil
                    @{ NSForegroundColorAttributeName : [UIColor colorWithRed:100.0/255.0 green:113.0/255.0 blue:127.0/255.0 alpha:1.0f],
                       NSFontAttributeName : [UIFont fontWithName:@"OpenSans" size:14.0] }];
    return attr_str;
}

-(CGFloat)getLabelHeight:(NSString*)_text FontName_Size:(UIFont *)_Font LebelWidth:(CGFloat)Width
{
    if ([_text isKindOfClass:[NSNull class]] || [_text length]==0) {
        
        _text = @"a";
    }
    
    CGFloat result = _Font.pointSize+4;
    if (_text) {
        
        CGRect frame = [_text boundingRectWithSize:CGSizeMake(Width, CGFLOAT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:_Font}
                                           context:nil];
        CGSize size = CGSizeMake(frame.size.width, frame.size.height+1);
        result = MAX(size.height, result); //At least one row
    }
    //MyLog(@"%f",floor(result));
    return floor(result);
}

//-(NSString *)SetDefaultMapIcons:(NSString *)iconName
//{
//    if (IS_IPAD) {
//        if (SCREEN_WIDTH == 768) {
//            return [NSString stringWithFormat:@"%@_iPad.png",iconName];
//        }
//        else{
//            return [NSString stringWithFormat:@"%@_iPad@2x.png",iconName];
//        }
//    }
//    else{
//        if (SCREEN_WIDTH == 375) {
//            return [NSString stringWithFormat:@"%@_iPhone-667h@2x.png",iconName];
//        }
//        else if (SCREEN_WIDTH == 414) {
//            return [NSString stringWithFormat:@"%@_iPhone-736h@3x.png",iconName];
//        }
//        else if (SCREEN_HEIGHT == 568) {
//            return [NSString stringWithFormat:@"%@_iPhone-568h@2x.png",iconName];
//        }
//        else if (SCREEN_WIDTH == 480) {
//            return [NSString stringWithFormat:@"%@_4S_iPhone@2x.png",iconName];
//        }
//    }
//    return nil;
//}
//
//-(NSString *)GetVideoFilePath:(NSString *)videoName
//{
//    if (IS_IPAD) {
//        if (SCREEN_WIDTH == 768) {
//            return [NSString stringWithFormat:@"%@_iPad",videoName];
//        }
//        else{
//            return [NSString stringWithFormat:@"%@_iPad@2x",videoName];
//        }
//    }
//    else{
//        if (SCREEN_WIDTH == 375) {
//            return [NSString stringWithFormat:@"%@_iPhone-667h@2x",videoName];
//        }
//        else if (SCREEN_WIDTH == 414) {
//            return [NSString stringWithFormat:@"%@_iPhone-736h@3x",videoName];
//        }
//        else if (SCREEN_HEIGHT == 568) {
//            return [NSString stringWithFormat:@"%@_iPhone-568h@2x",videoName];
//        }
//        else if (SCREEN_WIDTH == 480) {
//            return [NSString stringWithFormat:@"%@_4S_iPhone@2x",videoName];
//        }
//    }
//    return nil;
//}

-(CGFloat)Get_Y_Origin
{
    if (IS_IPAD) {
        return 78.0f;
    } else {
        return 56.0f;
    }
}


//-(NSString*)ConvertTimestampToDate:(NSString*)timestamp{
//    /*NSString * timeStampString =timestamp;
//    NSTimeInterval _interval=[timeStampString doubleValue];
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
//    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
//    //[_formatter setLocale:[NSLocale currentLocale]];
//    [_formatter setDateFormat:@"dd-MM-YYYY hh:mm:ss"];
//    
//    return [_formatter stringFromDate:date];*/
//    
//    double time_stamp = [timestamp doubleValue]/1000;
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
//    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
//    NSTimeZone *zone = [NSTimeZone timeZoneWithAbbreviation:@"IST"];
//    [dateFormatter setTimeZone:zone];pp
//    [dateFormatter setDateFormat:@"MM-dd-YYYY hh:mm a"];//hh:mm:ss
//    //NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
//    //[dateFormatter setLocale:usLocale];
//    
//    NSDate *dates = [NSDate dateWithTimeIntervalSince1970:time_stamp];
//    NSString *getDate = [dateFormatter stringFromDate:dates];
//    
//    return getDate;
//}
-(NSString*)ConvertTimestampToDate_notification:(NSString*)timestamp{
    NSString * timeStampString =timestamp;
     NSTimeInterval _interval=[timeStampString doubleValue];
     NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
     NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
     [_formatter setTimeZone:[NSTimeZone localTimeZone]];
     [_formatter setDateFormat:@"MM/dd/YYYY"];
      NSString *getDate = [_formatter stringFromDate:date];
     [_formatter setDateFormat:@"hh:mm a"];
    NSString *getTime = [_formatter stringFromDate:date];
    getDate=[NSString stringWithFormat:@"%@ at %@",getDate,getTime];
    return getDate;
}
-(NSString *)ConvertDateStringWithDifferntFormater:(NSString *)_dtStr withtime:(NSString *)_strTm forshow:(BOOL)show
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:show?@"yyyy-MM-dd":@"yyyy-MM-dd HH:mm:ss"];
    [dateFormat setTimeZone:show?[NSTimeZone localTimeZone]:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *date =[dateFormat dateFromString:show?[NSString stringWithFormat:@"%@",_dtStr]:[NSString stringWithFormat:@"%@ %@",_dtStr,_strTm]];
    
    NSDateFormatter *Newformatter = [[NSDateFormatter alloc] init];
    [Newformatter setTimeZone:[NSTimeZone localTimeZone]];
    [Newformatter setDateFormat: @"MM/dd/yyyy"];
    NSString *stringFromDate = [Newformatter stringFromDate:date];
    stringFromDate=[self NULLInputinitWithString:stringFromDate];
    if(!stringFromDate.length>0){
        stringFromDate=@"00/00/0000";
    }
    return stringFromDate;
}
-(NSString *)cnvrtdatewthnewFormt:(NSString *)_dtStr
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
   
    NSDate *date =[dateFormat dateFromString:_dtStr];
    
    NSDateFormatter *Newformatter = [[NSDateFormatter alloc] init];
    [Newformatter setDateFormat: @"MM/dd/yyyy"];
    //[Newformatter setDateFormat: @"dd/MM/yyyy"];
    NSString *stringFromDate = [Newformatter stringFromDate:date];
    stringFromDate=[self NULLInputinitWithString:stringFromDate];
    if(!stringFromDate.length>0){
        stringFromDate=@"00/00/0000";
    }
    return stringFromDate;
}

-(NSString *)ConvertTimeStringWithDifferntFormater:(NSString *)_tmStr
{
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm"];
    NSDate *date4time =[timeFormat dateFromString:_tmStr];
    
    NSDateFormatter *Newformatter = [[NSDateFormatter alloc] init];
    [Newformatter setDateFormat: @"HH/mm"];
    NSString *stringFromTime= [Newformatter stringFromDate:date4time];
    stringFromTime=[self NULLInputinitWithString:stringFromTime];
    if(!stringFromTime.length>0){
        stringFromTime=@"0/00";
    }
    return stringFromTime;
}

-(NSString *)ConvertTimeStringWithDifferntFormaterWithAMPM:(NSString *)_tmStr wthDate:(NSString *)_strDT forshow:(BOOL)show
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:show?@"HH:mm:ss":@"yyyy-MM-dd HH:mm:ss"];
    [dateFormat setTimeZone:show?[NSTimeZone localTimeZone]:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *date =[dateFormat dateFromString:show?[NSString stringWithFormat:@"%@",_tmStr]:[NSString stringWithFormat:@"%@ %@",_strDT,_tmStr]];
    
    NSDateFormatter *Newformatter = [[NSDateFormatter alloc] init];
    [Newformatter setTimeZone:[NSTimeZone localTimeZone]];
    [Newformatter setDateFormat: @"h:mm  a"];
    //[Newformatter setTimeStyle:NSDateFormatterShortStyle];
    NSString *stringFromTime= [Newformatter stringFromDate:date];
    stringFromTime=[[self NULLInputinitWithString:stringFromTime] lowercaseString];
//    [stringFromTime stringByReplacingOccurrencesOfString:@"a.m." withString:@"AM"];
//    [stringFromTime stringByReplacingOccurrencesOfString:@"p.m." withString:@"PM"];
   stringFromTime= [[stringFromTime stringByReplacingOccurrencesOfString:@"pm" withString:@"p.m."]stringByReplacingOccurrencesOfString:@"am" withString:@"a.m." ];
    if(!stringFromTime.length>0){
        stringFromTime=@"0:00 a.m.";
    }
    
    
    return stringFromTime;
}
-(void)addSubviewWithBounce_OnTheView:(UIView*)OnView AnnimatedView:(UIView*)theView
{
    theView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    theView.alpha=1.0;
    //[OnView addSubview:theView];
    [OnView bringSubviewToFront:theView];
    
    [UIView animateWithDuration:0.3/1 animations:^{
        theView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/1 animations:^{
            theView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/1 animations:^{
                theView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
}

-(BOOL)IsConnectedToNetwork {
    
//    __block BOOL reachable=NO;
//    
//    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager managerForDomain:@"www.google.com"];
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        //NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
//        
//        switch (status) {
//        case AFNetworkReachabilityStatusNotReachable:
//            //NSLog(@"No Internet Connection");
//            reachable = NO;
//            break;
//        case AFNetworkReachabilityStatusReachableViaWiFi:
//            //NSLog(@"WIFI");
//            
//            reachable = YES;
//            break;
//        case AFNetworkReachabilityStatusReachableViaWWAN:
//            //NSLog(@"3G");
//            reachable = YES;
//            break;
//        default:
//            //NSLog(@"Unkown network status");
//            reachable = NO;
//            break;
//            
//        }
//    }];
//    //[manager startMonitoring];
//    
//    return reachable;
    
    // Setting block doesn't means you area running it right now
    /*[[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                //NSLog(@"No Internet Connection");
                reachable = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                //NSLog(@"WIFI");
                
                reachable = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                //NSLog(@"3G");
                reachable = YES;
                break;
            default:
                //NSLog(@"Unkown network status");
                reachable = NO;
                break;
                
        }
    }];
    // and now activate monitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];*/
    
    //return reachable;
    return YES;
}
-(NSString *)convertbase64String:(NSString*)_string
{
    return [[_string dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
}

#pragma mark-
#pragma mark- No network view
-(void)addNoNetworkViewOverView:(UIView *)inview OriginY:(CGFloat)originy{
    [SVProgressHUD dismiss];
    UIView *view=(UIView *)[inview viewWithTag:NONETWORK_VIEWTAG];
    if (!view) {
        UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, originy, inview.frame.size.width, (IS_IPAD ? 60 : 45))];
        view.autoresizingMask=UIViewAutoresizingFlexibleWidth;
       // view.backgroundColor=[UIColor colorWithRed:0.0/255.0 green:171.0/255.0 blue:153.0/255.0 alpha:1.0];
        view.backgroundColor=[UIColor blackColor];
        view.tag=NONETWORK_VIEWTAG;
        UILabel *lblNoNetwork=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, inview.frame.size.width/1.5, (IS_IPAD ? 60 : 45))];
        lblNoNetwork.center=view.center;
        [lblNoNetwork setBackgroundColor:[UIColor clearColor]];
        [lblNoNetwork setTextAlignment:NSTextAlignmentCenter];
        [lblNoNetwork setFont:[UIFont fontWithName:@"FuturaBT-Book" size:12.0]];
        [lblNoNetwork setTextColor:[UIColor whiteColor]];
        [lblNoNetwork setText:[NSString stringWithFormat:@"No network connection!"]];
        [view addSubview:lblNoNetwork];
        [inview addSubview:view];
        [inview bringSubviewToFront:view];
        
        CGRect btnFrame=view.bounds;
        btnFrame.size.width=(IS_IPAD ? 60.0f : 45.0f);
        btnFrame.origin.x=view.frame.size.width-btnFrame.size.width-5.0f;//5 pixel padding from right.
        UIButton *btnCancel=[UIButton buttonWithType:UIButtonTypeCustom];
        [btnCancel setFrame:btnFrame];
        [btnCancel setImage:[UIImage imageNamed:@"SearchCloseIcon"] forState:UIControlStateNormal];
        [btnCancel addTarget:self action:@selector(removeNoNetworkViewFrombutton:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btnCancel];
        
        [view.layer removeAllAnimations];
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromBottom;
        transition.duration = 0.3f;
        [view.layer addAnimation:transition forKey:nil];
    }
}

-(void)removeNoNetworkViewFrombutton:(UIButton *)sender {
    __block UIView *view= sender.superview;
    if (view.tag==NONETWORK_VIEWTAG) {
        [view.layer removeAllAnimations];
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromTop;
        transition.duration = 0.3f;
        [view.layer addAnimation:transition forKey:nil];
        view.hidden=YES;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view.layer removeAllAnimations];
            [view removeFromSuperview];
            view = nil;
        });
    }
}

-(void)removeNoNetworkView:(UIView *)inview{
    __block UIView *view=[inview viewWithTag:NONETWORK_VIEWTAG];
    if (view) {
        [view.layer removeAllAnimations];
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromTop;
        transition.duration = 0.3f;
        [view.layer addAnimation:transition forKey:nil];
        view.hidden=YES;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view.layer removeAllAnimations];
            [view removeFromSuperview];
            view = nil;
        });
    }
}
#pragma mark - Resize Image
-(UIImage *)imageResize:(UIImage *)_img ImageSize:(float)_maxSize{
    if(_img.size.width>=_img.size.height){
        if(_img.size.width>_maxSize){
            CGSize newSize = CGSizeMake(_maxSize, _maxSize*(_img.size.height/_img.size.width));
            
            UIGraphicsBeginImageContext( newSize );
            [_img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
            UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            return   newImage;
        }
        else
            return _img;
    }
    else if(_img.size.height>_img.size.width){
        if(_img.size.height>_maxSize){
            CGSize newSize = CGSizeMake(_maxSize*(_img.size.width/_img.size.height),_maxSize );
            
            UIGraphicsBeginImageContext( newSize );
            [_img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
            UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            return   newImage;
        }
        else
            return _img;
    }
    else
        return _img;
}
-(NSString *)convertTimeStampDaetFromString:(NSString *)strDate withTime:(NSString *)strtime{
    strDate=[NSString stringWithFormat:@"%@ %@",strDate,strtime];
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *objUTCDate =[dateFormat dateFromString:strDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];//hh:mm:ss
    NSString *Date = [dateFormatter stringFromDate:objUTCDate];
    [dateFormatter setDateFormat:@"h:mm  a"];
    NSString *gettime = [dateFormatter stringFromDate:objUTCDate];
    if(!Date.length>0){
        Date=@"00/00/0000";
    }
    
    if(!gettime.length>0){
        gettime=@"0/00";
    }
    NSString *getDate=[NSString stringWithFormat:@"%@ at %@",Date,gettime];
    return getDate;
}
-(NSString *)cnvrtLocaldateToUTCdate:(NSString *)_dtStr withTime:(NSString *)_strtime
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormat setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDate *date =[dateFormat dateFromString:[NSString stringWithFormat:@"%@ %@",_dtStr,_strtime]];
    
    NSDateFormatter *Newformatter = [[NSDateFormatter alloc] init];
    [Newformatter setDateFormat: @"yyyy-MM-dd"];
    [Newformatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSString *stringFromDate = [Newformatter stringFromDate:date];
    
    return stringFromDate;
}
-(NSString *)ConvertLocalTimeToUTCTime:(NSString *)_tmStr withdate:(NSString *)_strDt
{
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date4time =[timeFormat dateFromString:[NSString stringWithFormat:@"%@ %@",_strDt,_tmStr]];
    [timeFormat setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDateFormatter *Newformatter = [[NSDateFormatter alloc] init];
    [Newformatter setDateFormat: @"HH:mm"];
    //[Newformatter setTimeStyle:NSDateFormatterShortStyle];
    [Newformatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSString *stringFromTime= [Newformatter stringFromDate:date4time];
    return stringFromTime;
}
-(NSDate *)convertDateFromString:(NSString *)_str4date withTime:(NSString *)_strtime{
    NSString *strDate=[NSString stringWithFormat:@"%@ %@",_str4date,_strtime];
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *objUTCDate =[dateFormat dateFromString:strDate];
    return objUTCDate;
}
-(NSString *)convertTimeStampDaetFOR_EDITFromString:(NSString *)strDate withTime:(NSString *)strtime{
    strDate=[NSString stringWithFormat:@"%@ %@",strDate,strtime];
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *objUTCDate =[dateFormat dateFromString:strDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];//hh:mm:ss
    NSString *Date = [dateFormatter stringFromDate:objUTCDate];
    
    if(!Date.length>0){
        Date=@"00/00/0000";
    }
    
   
    return Date;
}
-(NSString *)convertTimeStampTime_FOR_EDIT_FromString:(NSString *)strDate withTime:(NSString *)strtime{
    strDate=[NSString stringWithFormat:@"%@ %@",strDate,strtime];
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *objUTCDate =[dateFormat dateFromString:strDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *gettime = [dateFormatter stringFromDate:objUTCDate];
    
    
    if(!gettime.length>0){
        gettime=@"0:00";
    }
    return gettime;
}
-(NSDateFormatter *)dateFormatter
{
    if (!self.formatter4date) {
        _formatter4date = [[NSDateFormatter alloc] init];
    }
    return self.formatter4date;
}
@end
NSString *encodeEmojiString(NSString *actualString) {
    actualString = [actualString stringByReplacingOccurrencesOfString:@"'" withString:@"¶¶1"];
    actualString = [actualString stringByReplacingOccurrencesOfString:@"," withString:@"¶¶2"];
    actualString = [actualString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return actualString;
}

NSString *decodeEmojiString(NSString *encodedString) {
    
    NSString *str=encodedString;
    encodedString = [encodedString stringByRemovingPercentEncoding];
    if([[Common SharedInstance] NULLInputinitWithString:encodedString].length==0){
        for (int i=0; str.length; i++) {
            str=[str substringToIndex:[str length] - 1];
            encodedString = [str stringByRemovingPercentEncoding];
            if([[Common SharedInstance] NULLInputinitWithString:encodedString].length>0){
                break;
            }
        }
        
    }
   // encodedString = [encodedString stringByRemovingPercentEncoding];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"¶¶2" withString:@","];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"¶¶1" withString:@"'"];
    return encodedString;
}
NSString* convertGMTDateToLocalDate(NSString* dateTime,NSString *dateFormat,BOOL showTime,BOOL showDate4Email){
    
    NSDateComponents *components;
    NSInteger days;
    
    [[[Common SharedInstance] dateFormatter] setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [[[Common SharedInstance] dateFormatter] setDateFormat:dateFormatForGMT];
    NSDate *inDate = [[[Common SharedInstance] dateFormatter] dateFromString:dateTime];
    
    if(showDate4Email){
        
        [[[Common SharedInstance] dateFormatter] setTimeZone:[NSTimeZone localTimeZone]];
        [[[Common SharedInstance] dateFormatter] setDateFormat:dateFormat];
        
        return [[[Common SharedInstance] dateFormatter] stringFromDate:inDate];
    }
    else{
        
        if(![dateFormat isEqualToString:timeFormat1]){
            
            [[[Common SharedInstance] dateFormatter] setDateFormat:onlyDateFormatForGMT];
            NSString *str =[[[Common SharedInstance] dateFormatter] stringFromDate:inDate];
            NSString *str1 =[[[Common SharedInstance] dateFormatter] stringFromDate:[NSDate date]];
            
            components = [[NSCalendar currentCalendar] components: NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute fromDate:[[[Common SharedInstance] dateFormatter] dateFromString:str] toDate:[[[Common SharedInstance] dateFormatter] dateFromString:str1] options:1];
            
            days = [components day];
            
            if(days>0){
                if(days>1){
                    [[[Common SharedInstance] dateFormatter] setTimeZone:[NSTimeZone localTimeZone]];
                    [[[Common SharedInstance] dateFormatter] setDateFormat:dateFormat];
                    
                    return [[[Common SharedInstance] dateFormatter] stringFromDate:inDate];
                }
                else{
                    return @"Yesterday";
                }
            }
            else{
                if(showTime){
                    [[[Common SharedInstance] dateFormatter] setTimeZone:[NSTimeZone localTimeZone]];
                    [[[Common SharedInstance] dateFormatter] setDateFormat:timeFormat1];
                    
                    return [[[Common SharedInstance] dateFormatter] stringFromDate:inDate];
                }
                else{
                    return @"Today";
                }
            }
        }
        else{
            [[[Common SharedInstance] dateFormatter] setTimeZone:[NSTimeZone localTimeZone]];
            [[[Common SharedInstance] dateFormatter] setDateFormat:dateFormat];
            
            return [[[Common SharedInstance] dateFormatter] stringFromDate:inDate];
        }
    }
}
