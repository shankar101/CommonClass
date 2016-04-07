//
//  Common.h
//  ChildrenStrorybook
//
//  Created by Apple on 13/05/13.
//  Copyright (c) 2013 Indusnet Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "TJSpinner.h"
#import "RLTopbarController.h"
#import "RLContentNavigationController.h"
#import "RLMainNavigationController.h"
#import "RLAppDelegate.h"
#import "RLContainerController.h"


typedef enum{
    SplshScrn,
    LogIn,
    SignUpScreen,
    other,
    RgnListScrn,
    home,
    DashboardScrn,
    AlertScrn,
    EventScrn,
    MyEventScrn,
    EventDetailsScrn,
    MyEventDtlsScrn,
    CrtEvntScrn,
    RideLstScrn,
    MyRideScrn,
    RideDtlsScrn,
    MyRideDtlsScrn,
    CretRideScrn,
    GrpLstScrn,
    MyGrpLstScrn,
    GrpDtlsScrn,
    MyGrpDtlsScrn,
    GrpCrtScrn,
    MyAcntScrn,
    sendMessageScrn,
    sendIndividualScrn,
    PostListScrn,
    PostDetailsScrn,
    selectuserList,
    createPost,
    createGrpScrn,
    termsandCondition,
    
}WhereIAm;
typedef enum
{
    DataAvilable,
    DataUnAvailable,
    
    
}FordataAvilability;
typedef enum
{
    CreateGroup,
    Editgroup,
    SendMsgFrGrp,
    RegistrtionApi,
    LogingApi,//
    ValidSessionApi,
    RegionApi,//
    SaveRegionApi,//
    CreateEvntApi,//
    UpdateEventApi,
    EventListApi,//
    MyEventListApi,//
    EventDetlsApi,//
    EvntCtgryLstApi,//
    JoinEventApi,//
    CrtRideApi,//
    editRideApi,
    RideLstApi,//
    MyRideListApi,//
    JoinRideApi,
    RideDetlsApi,
    ChangePrflApi,//
    ChangPasswrdApi,//
    AddAlrtApi,//
    SendMailApi,
    AlrtLstApi,//
    DashBrdApi,//
    MemberListApi,
    JoinGrpApi,
    MyGrpLstApi,//
    GrpListApi,
    CrtPostApi,
    PostListApi,
    SndGrpMsgApi,
    SndGrpIndVdlMsgApi,
    ViewGrpMsg,
    VwindividualMsg,
    PostReply,
    PostreplyLis,
    forgetpassword,//
    grpdtlsApi,
    groupmemberlist,
    RideReply,
    RideReplyList,
    Startride,
    leavegrp,
    abuse,
    
}ForWhichApi;


@interface Common : NSObject

@property (nonatomic, readwrite) WhereIAm _where;
@property (nonatomic,readwrite) FordataAvilability _forAvilityChek;
@property (nonatomic,readwrite) ForWhichApi _frWhichApiCll;
@property (nonatomic, readwrite) int queueCount;
@property (strong, nonatomic) NSOperationQueue *queue;
@property (strong, nonatomic) dispatch_queue_t backgroundQueue;
@property (nonatomic, readwrite) int isDatabaseBusy;
@property (nonatomic, assign) BOOL isPanelActive;
@property (strong, nonatomic) NSString *cityLatLong;
@property (strong, nonatomic) NSString *placeName;
@property (nonatomic, assign) BOOL isFromLogIn;
@property (nonatomic, assign) BOOL isFromAboutUs;
@property (nonatomic, assign) BOOL isFromSplash;
@property (nonatomic, assign) BOOL isUserLoggingOut;
//@property (nonatomic, strong) TJSpinner *customSpinner;
@property (nonatomic, assign) CGRect rectAnnotation;
@property (nonatomic, readwrite) int offsetHeight1;
@property (nonatomic, readwrite) int offsetHeight2;
@property (nonatomic,weak) RLContentNavigationController *mRLContentNavigationController;
@property (nonatomic,weak) RLTopbarController *mRLTopbarController;
@property (nonatomic,weak) RLMainNavigationController *navicationControllerMain;
@property (nonatomic,weak) RLContainerController *obj4ContainerContrl;
@property (nonatomic, strong) RLAppDelegate *appDelegate;
@property (nonatomic,weak)UIButton *btn4signUp;
@property (nonatomic,weak)UIView *Vw4stngsPopUp;
@property (nonatomic,weak)UIView *Vw4FilterPopUp;
@property (nonatomic,weak) UIView *Vw4stngsDropDown;
@property (weak, nonatomic) NSLayoutConstraint *constant4SettingsHeight;
///
//
+(Common *)SharedInstance;
-(void)insertIntoQueue:(NSInvocationOperation *)_operation;
- (NSString *)getNibName:(NSString *)OriginalnibName;
-(NSString *)GetCurrentDate;
-(void)startLoadingWithMessage:(NSString*)massage onView:(id)_view;
-(void)stopLoading_onView:(id)_view;
-(NSString *)ReplaceSpecialCharacter:(NSString *)_str;
-(NSString *)OutPutReplaceSpecialCharacter:(NSString *)_str;
-(NSString *)ReplaceWhiteSpaces:(NSString *)_str;
-(void)OpenRightPanelList_OnMenuClick;
-(NSString *)BreakSecondsInto_Years_Months_Days_Hours_Minutes_Seconds:(int)secs;

-(BOOL)isiPad;
-(BOOL)isiPadRetina;
-(BOOL)isiPhone;
-(BOOL)isiPhoneRetina;
-(BOOL)isiPhone5;

-(BOOL)validateEmail:(NSString *)Email;
-(NSString *)NULLInputinitWithString:(NSString*)InputString;
-(void)ShowAlertWithMessage:(NSString *)AlertMessage;

-(void)storObject:(NSString *)value forKeyPath:(NSString *)key;
-(void)storBool:(BOOL)value forKeyPath:(NSString *)key;
-(void)storInt:(int)value forKeyPath:(NSString *)key;
-(int)getIntForKeyPath:(NSString *)key;
-(BOOL)getBoolForKeyPath:(NSString *)key;
-(void)removeObjectForKey:(NSString *)key;
-(NSString *)getValueForKeypath:(NSString *)key;

//-(UIColor *)Get_RGB_ColorFor_SelectedCategory:(int)CategoryId;
-(NSAttributedString *)GetPlaceholderColor_addWorkOrder:(UITextField *)txtField;
-(NSString *)ReplaceStringwhenGetZero:(NSString *)_str;
-(NSString *)cnvrtdatewthnewFormt:(NSString *)_dtStr;

-(NSAttributedString *)GetPlaceholderColor:(UITextField *)txtField;
-(CGFloat)getLabelHeight:(NSString*)_text FontName_Size:(UIFont *)_Font LebelWidth:(CGFloat)Width;
//-(NSString *)SetDefaultMapIcons:(NSString *)iconName;
//-(NSString *)GetVideoFilePath:(NSString *)videoName;
-(CGFloat)Get_Y_Origin;
//-(NSString*)ConvertTimestampToDate:(NSString*)timestamp;
-(NSString*)ConvertTimestampToDate_notification:(NSString*)timestamp;
-(void)addSubviewWithBounce_OnTheView:(UIView*)OnView AnnimatedView:(UIView*)theView;
-(BOOL)IsConnectedToNetwork;
-(NSAttributedString *)GetPlaceholderColor4CreateEvent:(UITextField *)txtField;
-(NSString *)convertbase64String:(NSString*)_string;

-(void)addNoNetworkViewOverView:(UIView *)inview OriginY:(CGFloat)originy;
-(void)removeNoNetworkView:(UIView *)inview;
-(UIImage *)imageResize:(UIImage *)_img ImageSize:(float)_maxSize;
-(NSString *)ConvertDateStringWithDifferntFormater:(NSString *)_dtStr withtime:(NSString *)_strTm forshow:(BOOL)show;
-(NSString *)ConvertTimeStringWithDifferntFormater:(NSString *)_tmStr;
-(NSString *)ConvertTimeStringWithDifferntFormaterWithAMPM:(NSString *)_tmStr wthDate:(NSString *)_strDT forshow:(BOOL)show;
-(NSString *)convertTimeStampDaetFromString:(NSString *)strDate withTime:(NSString *)strtime;
-(NSString *)cnvrtLocaldateToUTCdate:(NSString *)_dtStr withTime:(NSString *)_strtime;
-(NSString *)ConvertLocalTimeToUTCTime:(NSString *)_tmStr withdate:(NSString *)_strDt;
-(NSDate *)convertDateFromString:(NSString *)_str4date withTime:(NSString *)_strtime;
-(NSString *)convertTimeStampDaetFOR_EDITFromString:(NSString *)strDate withTime:(NSString *)strtime;
-(NSString *)convertTimeStampTime_FOR_EDIT_FromString:(NSString *)strDate withTime:(NSString *)strtime;
@end
extern NSString *encodeEmojiString(NSString *actualString);
extern NSString *decodeEmojiString(NSString *encodedString);
