
#import "RNUnityAdsModule.h"

@implementation RNUnityAdsModule

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"Ready", @"Start", @"Finish", @"Error"];
}

RCT_EXPORT_METHOD(getSDKVersion: (RCTResponseSenderBlock)callback)
{
    callback(@[@([UnityAds version])]);
}

RCT_EXPORT_METHOD(isSupported:(RCTResponseSenderBlock)callback) {
    callback(@[@([UnityAds isSupported])]);
}

RCT_EXPORT_METHOD(initialize:(NSString *)gameID) {
    [UnityAds initialize:gameID delegate:self];
}

RCT_EXPORT_METHOD(isInitialized:(RCTResponseSenderBlock)callback)
{
    callback(@[@([UnityAds isInitialized])]);
}

RCT_EXPORT_METHOD(getListener:(RCTResponseSenderBlock)callback)
{
    callback(@[self]);
}

RCT_EXPORT_METHOD(isReady:(NSString *)placementID callback:(RCTResponseSenderBlock)callback)
{
    if ([placementID isEqual:NULL]) {
        callback(@[@([UnityAds isReady])]);
    }
    else {
        callback(@[@([UnityAds isReady:placementID])]);
    }
}

RCT_EXPORT_METHOD(getPlacementState:(NSString *)placementID callback:(RCTResponseSenderBlock)callback)
{
    if ([placementID isEqual:@""]) {
        callback(@[[self enumPlacementStateToString:[UnityAds getPlacementState]]]);
    }
    else {
        callback(@[[self enumPlacementStateToString:[UnityAds getPlacementState:placementID]]]);
    }
}

RCT_EXPORT_METHOD(show:(NSString *)placementID) {
    if ([placementID isEqual:@""]) {
        if ([UnityAds isReady]) {
            [UnityAds show: [UIApplication sharedApplication].keyWindow.rootViewController];
        }
    }
    else {
        if ([UnityAds isReady:placementID]) {
            [UnityAds show: [UIApplication sharedApplication].keyWindow.rootViewController placementId:placementID];
        }
    }
}

- (void) unityAdsReady:(NSString *)placementID
{
    NSDictionary * params = [[NSDictionary alloc] initWithObjectsAndKeys:placementID, @"placementID", nil];
    [self sendEventWithName:@"Ready" body:params];
}

- (void) unityAdsDidStart:(NSString *)placementID
{
    NSDictionary * params = [[NSDictionary alloc] initWithObjectsAndKeys:placementID, @"placementID", nil];
    [self sendEventWithName:@"Start" body:params];
}

- (void) unityAdsDidFinish:(nonnull NSString *)placementID withFinishState:(UnityAdsFinishState)result
{
    NSDictionary * params = [[NSDictionary alloc] initWithObjectsAndKeys:placementID, @"placementID", [self enumFinishStateToString:result], @"result", nil];
    [self sendEventWithName:@"Finish" body:params];
}

- (void) unityAdsDidError:(UnityAdsError)error withMessage:(NSString *)message
{
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:[self enumErrorToString:error], @"error", message, @"message", nil];
    [self sendEventWithName:@"Error" body:params];
}

- (NSString*) enumFinishStateToString:(UnityAdsFinishState)enumValue
{
    NSString *result = nil;
    
    switch(enumValue)
    {
        case kUnityAdsFinishStateError:
            result = @"UnityAdsFinishStateError";
            break;
        case kUnityAdsFinishStateSkipped:
            result = @"UnityAdsFinishStateSkipped";
            break;
        case kUnityAdsFinishStateCompleted:
            result = @"UnityAdsFinishStateCompleted";
            break;
        default:
            result = @"UnityAdsFinishStateError";
            break;
    }
    
    return result;
}

- (NSString*) enumPlacementStateToString:(UnityAdsPlacementState)enumValue
{
    NSString *result = nil;
    
    switch(enumValue)
    {
        case kUnityAdsPlacementStateReady:
            result = @"UnityAdsReady";
            break;
        case kUnityAdsPlacementStateNoFill:
            result = @"UnityAdsNoFill";
            break;
        case kUnityAdsPlacementStateWaiting:
            result = @"UnityAdsWaiting";
            break;
        case kUnityAdsPlacementStateDisabled:
            result = @"UnityAdsDisabled";
            break;
        case kUnityAdsPlacementStateNotAvailable:
            result = @"UnityAdsNotAvaliable";
            break;
            
        default:
            result = @"UnityAdsNotAvaliable";
            break;
            
    }
    
    return result;
}

- (NSString*) enumErrorToString:(UnityAdsError)enumValue
{
    NSString *result = NULL;
    
    switch(enumValue)
    {
        case kUnityAdsErrorShowError:
            result = @"UnityAdsShowError";
            break;
        case kUnityAdsErrorFileIoError:
            result = @"UnityAdsFileIoError";
            break;
        case kUnityAdsErrorDeviceIdError:
            result = @"UnityAdsDeviceIdError";
            break;
        case kUnityAdsErrorInternalError:
            result = @"UnityAdsInternalError";
            break;
        case kUnityAdsErrorNotInitialized:
            result = @"UnityAdsNotInitialized";
            break;
        case kUnityAdsErrorInvalidArgument:
            result = @"UnityAdsInvalidArgument";
            break;
        case kUnityAdsErrorVideoPlayerError:
            result = @"UnityAdsVideoPlayerError";
            break;
        case kUnityAdsErrorAdBlockerDetected:
            result = @"UnityAdsAdBlockerDetected";
            break;
        case kUnityAdsErrorInitializedFailed:
            result = @"UnityAdsInitializedFailed";
            break;
        case kUnityAdsErrorInitSanityCheckFail:
            result = @"UnityAdsInitSanityCheckFail";
            break;
            
        default:
            result = @"UnityAdsNotInitialized";
            break;
            
    }
    
    return result;
}


@end
  
