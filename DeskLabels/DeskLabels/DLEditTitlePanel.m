//
//  SDEditTitlePanel.m
//  DeskNotation
//
//  Created by Steven Degutis on 6/30/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "DLEditTitlePanel.h"


@implementation DLEditTitlePanel

- (id) initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag {
	if (self = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag]) {
		[self setBackgroundColor:[NSColor clearColor]];
		[self setOpaque:NO];
	}
	return self;
}

@end
