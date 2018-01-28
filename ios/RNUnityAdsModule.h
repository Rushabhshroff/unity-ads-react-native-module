
#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#else
#import "RCTBridgeModule.h"
#endif

#import <UnityAds/UnityAds.h>
#import <React/RCTConvert.h>
#import <React/RCTEventEmitter.h>

@interface RNUnityAdsModule : RCTEventEmitter <RCTBridgeModule, UnityAdsDelegate>

@property(nonatomic, retain, readonly) NSString * name;
- (void) getSDKVersion:(RCTResponseSenderBlock)callback;
- (void) isSupported:(RCTResponseSenderBlock)callback;
- (void) initialize:(NSString *)gameID;
- (void) isInitialized:(RCTResponseSenderBlock)callback;
- (void) getPlacementState:(NSString *)placementID callback:(RCTResponseSenderBlock)callback;
- (void) isReady:(NSString *)placementID callback:(RCTResponseSenderBlock)callback;
- (void) show:(NSString *)placementID;
- (void) unityAdsReady:(NSString *)placementID;
- (void) unityAdsDidStart:(NSString *)placementID;
- (void) unityAdsDidFinish:(NSString *)placementID withFinishState:(UnityAdsFinishState)result;
- (void) unityAdsDidError:(UnityAdsError)error withMessage:(NSString *)message;
- (NSString*) enumFinishStateToString:(UnityAdsFinishState)enumValue;
- (NSString*) enumPlacementStateToString:(UnityAdsPlacementState)enumValue;
- (NSString*) enumErrorToString:(UnityAdsError)enumValue;
@end
  
