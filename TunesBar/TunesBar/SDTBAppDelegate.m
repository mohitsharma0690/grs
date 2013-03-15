//
//  SDTBAppDelegate.m
//  TunesBar
//
//  Created by Steven Degutis on 3/14/13.
//  Copyright (c) 2013 Steven Degutis. All rights reserved.
//

#import "SDTBAppDelegate.h"

#import "SDPreferencesWindowController.h"

#import "SDGeneralPrefPane.h"

@implementation SDTBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"DefaultValues" ofType:@"plist"];
	NSDictionary *initialValues = [NSDictionary dictionaryWithContentsOfFile:plistPath];
	[[NSUserDefaults standardUserDefaults] registerDefaults:initialValues];
    
    [iTunesProxy proxy].delegate = self.statusItemController;
    [[iTunesProxy proxy] loadInitialTunesBarInfo];
    [self.statusItemController setupStatusItem];
    
    self.howToWindowController = [[SDHowToWindowController alloc] init];
    [self.howToWindowController showInstructionsWindow];
//    [self.howToWindowController showInstructionsWindowFirstTimeOnly];
}

- (IBAction) showPreferencesWindow:(id)sender {
    [NSApp activateIgnoringOtherApps:YES];
    
    if (self.preferencesWindowController == nil) {
        self.preferencesWindowController = [[SDPreferencesWindowController alloc] init];
        [self.preferencesWindowController usePreferencePaneControllerClasses:@[[SDGeneralPrefPane self]]];
    }
    
    [self.preferencesWindowController showWindow:sender];
}

- (IBAction) reallyShowAboutPanel:(id)sender {
    [NSApp activateIgnoringOtherApps:YES];
    [NSApp orderFrontStandardAboutPanel:sender];
}

@end
