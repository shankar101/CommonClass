//
//  CommonConstants.h
//  Demo_Distance
//
//  Created by Shankar Mallick on 29/10/14.
//  Copyright (c) 2014 Shankar Mallick. All rights reserved.
//

#ifndef Demo_Distance_CommonConstants_h
#define Demo_Distance_CommonConstants_h

#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define ShareDelegate [[UIApplication sharedApplication] delegate]


#define SAVE_AS_DEFAULT(_key,_value) [[NSUserDefaults standardUserDefaults]setObject:_value forKey:_key]

#define GET_DEFAUL_VALUE(_key) [[NSUserDefaults standardUserDefaults]objectForKey:_key]

#define REMOVE_DEFAULT_KEY(_key)  [[NSUserDefaults standardUserDefaults] removeObjectForKey:_key]

#define SYNCH_DEFAULT  [[NSUserDefaults standardUserDefaults] synchronize]



#define kSERVER_ADDRESS @""

#define RESIZE_PROFILE_IMAGE 400

#define UserId @"userId"
#define sessionSucseeMsg @"susseson sucsess Chacking"
#define SessionToken @"sessiontoken"
#define Str4Region @"strRegion"
#define kTAG_INDICATOR_VIEW      4756
#define kTAG_INDICATOR           8957
#define kTAG_ONLY_INIDCATOR      2145
#define kTagCustomSpinner        68454

#define kTAG_UPGRADE_TBL 3333
#define kTAG_INAPP_PURCHASE_TBL 4444

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define ADD_QUEUE_INTERVAL 0.5
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define IS_IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define NAV_BAR_HEIGHT (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) ? 56 : 78
#define ACCEPTABLE_CHARACTERS4PHONENO @"0123456789"
#define ACCEPTABLE_CHARACTERS4Hours @"0123456789."


#define kALERT_CONFIGURATION @"App not configured."

#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]

#define MAX_HEADER_HEIGHT 202
#define MIN_HEADER_HEIGHT 84
#define MAX_HEADER_HEIGHt_GrpDETAILS 0//144
#define MIN_TABLE_HEIGHT 72
#define  Arrow_height 10
#define Logout_Tag 35753
#define LIST_PAGESIZE 50

#pragma mark Notification
#define Add_Observer_Notification(parent,Selector_Name,Notification_Name,_object) [[NSNotificationCenter defaultCenter]addObserver:parent selector:@selector(Selector_Name:) name:Notification_Name object:_object];

#define Remove_Observer_Notification(parent,Notification_Name,_object) [[NSNotificationCenter defaultCenter]removeObserver:parent name:Notification_Name object:_object];

#define Post_Notification(Notification_Name,_object) [[NSNotificationCenter defaultCenter]postNotificationName:Notification_Name object:_object];

#define DOC_PATH(path)[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:path]

#define PAUSE_MOVIE @"PauseMovieNotification"
#define RESUME_MOVIE @"ResumeMovieNotification"

#define CacheDirectory [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define HANDLE_RIGHT_PANEL_ACTIONS @"HandleRigntPanelActionNotification"
#define NONETWORK_VIEWTAG 2222

//NSString * const kOTTNoNetwork = @"kNoNetwork";
//NSString * const kOTTNetworkAvailable = @"kNetworkAvailable";
//If the dates are equal then returning NSOrderedSame
//
//If ascending ( 2nd arg > 1st arg ) return NSOrderedAscending
//
//If descending ( 2nd arg < 1st arg ) return NSOrderedDescending
#endif
