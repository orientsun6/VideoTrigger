//
//  ConnectionViewController.m
//  VideoTrigger
//
//  Created by charles on 4/8/16.
//  Copyright © 2016 charles. All rights reserved.
//

#import "ConnectionViewController.h"

@interface ConnectionViewController ()

@end

@implementation ConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [_appDelegate.mcManager setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];
    [_appDelegate.mcManager advertiseSelf:_visSwitch.on];
    _textField.delegate = self;
}

- (IBAction)browseForDevices:(id)sender{
    [_appDelegate.mcManager setupMCBrowser];
    _appDelegate.mcManager.browser.delegate = self;
    [self presentViewController:_appDelegate.mcManager.browser animated:YES completion:nil];
}

- (IBAction)toggleVisibility:(id)sender{
    [_appDelegate.mcManager advertiseSelf:_visSwitch.on];
}

- (IBAction)disconnect:(id)sender{
    
}


-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController{
    [_appDelegate.mcManager.browser dismissViewControllerAnimated:YES completion:nil];
}


-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController{
    [_appDelegate.mcManager.browser dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_textField resignFirstResponder];
    
    _appDelegate.mcManager.peerID = nil;
    _appDelegate.mcManager.session = nil;
    _appDelegate.mcManager.browser = nil;
    
    if (_visSwitch.on) {
        [_appDelegate.mcManager.advertiser stop];
    }
    
    _appDelegate.mcManager.advertiser = nil;
    
    [_appDelegate.mcManager setupPeerAndSessionWithDisplayName:_textField.text];
    [_appDelegate.mcManager setupMCBrowser];
    [_appDelegate.mcManager advertiseSelf:_visSwitch.on];
    
    return YES;
}

@end
