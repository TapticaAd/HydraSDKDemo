//
//  ViewController.m
//  HydraSDKDemo
//
//  Created by Nissim Pardo on 4/28/15.
//  Copyright (c) 2015 Hydra. All rights reserved.
//

#import "ViewController.h"
#import <HydraSDK/HydraSDK.h>

@interface ViewController () <HAdBannerDelegate, HInterstitialDelegate>{
    HAdBanner *banner;
    HInterstitial *interstitial;
    __weak IBOutlet UIView *bannerHolderView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!banner) {
        banner = [[HAdBanner alloc] initWithAdSize:(CGSize){320, 50} origin:CGPointZero];
        banner.unitAdID = @"115";
        banner.delegate = self;
        banner.rootViewController = self;
        banner.requestParams.shouldOpenInNativeBrowser = YES;
        [banner loadAd];
        [bannerHolderView addSubview:banner];
    }
}
- (IBAction)presentInterstitial:(UIButton *)sender {
    interstitial = [[HInterstitial alloc] init];
    interstitial.unitAdID = @"113";
    interstitial.delegate = self;
    [interstitial loadAd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark HInterstitialDelegate
- (void)interstitialDidReceiveAd:(HInterstitial *)ad {
    [ad presentFromRootViewController:self];
}

@end
