#import <UIKit/UIKit.h>

%hook OMAppLovinInterstitial
-(void)adService:(id)arg1 didLoadAd:(id)arg2 {
    arg1 = NULL;
    arg2 = NULL;
}
%end

%hook OMAppLovinBanner
-(void)adService:(id)arg1 didLoadAd:(id)arg2 {
    arg2 = NULL;
    arg1 = NULL;
}
%end

%hook OMMintegralRewardedVideo
-(void)loadAd {
}
%end

%hook OMMintegralInterstitial
-(void)loadAd {
}
%end

%hook OMMintegralBanner
-(void)loadAd {
}
%end

%hook AdTimingAdsRewardedVideoAd
-(void)loadAd {
}
%end

%hook AdTimingAdsAdBase
-(void)loadAd:(long long)arg1 bidPyaload:(id)arg2 {
    arg2 = NULL;
    arg1 = 0;
}
%end

%hook AdTimingAdBase
-(id)adLoader {
    return NULL;
}
%end

%hook AdTimingAdBase
-(void)setAdLoader:(id)arg1 {
    arg1 = NULL;
}
%end

%hook ALAdService
-(id)adLoadStates {
    return NULL;
}
%end

%hook ALAdLoadState
-(id)adLoadLock {
    return NULL;
}
%end

%hook ALAdLoadState
-(bool)isWaitingForAd {
    return 0;
}
%end

%hook ALAdLoadState
-(void)setIsWaitingForAd:(bool)arg1 {
    arg1 = 0;
    return %orig;
}
%end

%hook DeviceManager
-(bool)checkAppSync {
    return 1;
}
%end

%hook DeviceManager
-(void)warnAppSync {
    return %orig;
}
%end

%hook DeviceManager
-(void)joinDiscord {
    return %orig;
}
%end

%hook AppDelegate
-(void)applicationDidBecomeActive:(id)arg {

NSUserDefaults *validate = [NSUserDefaults standardUserDefaults];
NSString *alreadyRun = @"already_run";
if ([validate boolForKey:alreadyRun])
return;
[validate setBool:YES forKey:alreadyRun];
UIAlertView *credits = [[UIAlertView alloc] initWithTitle:@"AppCake++ v0.6b"
message:@"Features: \n -No Ads \n -No AppSync Pop Up \n\n Changes: \n - Allows now installing on Substitue"
                                                 delegate:self
  					cancelButtonTitle:@"Close"
  					otherButtonTitles:@"Twitter", nil];
[credits show];
//[credits release];
%orig();
}

%new
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

NSString *button = [alertView buttonTitleAtIndex:buttonIndex];

	if([button isEqualToString:@"Twitter"])
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/CrafterPika"]];
	}
}
%end
