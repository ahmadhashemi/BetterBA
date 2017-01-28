#import "./Headers.h"

static NSString *preferencesFilePath = @"/private/var/mobile/Library/Preferences/com.ahmad.betterba.plist";

%hook PasscodeViewController

-(void)viewDidAppear:(BOOL)animated {

	%orig;

	[self dismissViewControllerAnimated:YES completion:nil];

}

%end

%hook CardInfoEntryViewController

-(void)viewWillAppear:(BOOL)animated {

	%orig;

	NSMutableDictionary *preferences = [NSDictionary dictionaryWithContentsOfFile:preferencesFilePath].mutableCopy;
	if (!preferences) return;

	NSString *passcode = preferences[@"Passcode"];
	if (!passcode) return;

	WRFieldSetView *cell = (WRFieldSetView *)[self.formView.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	cell.textField.text = passcode;

}

-(void)viewWillDisappear:(BOOL)animated {

	%orig;

	NSMutableDictionary *preferences = [NSDictionary dictionaryWithContentsOfFile:preferencesFilePath].mutableCopy;
	if (!preferences) preferences = [[NSMutableDictionary alloc] init];

	WRFieldSetView *cell = (WRFieldSetView *)[self.formView.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	NSString *passcode = cell.textField.text;

	[preferences setObject:passcode forKey:@"Passcode"];
	[preferences writeToFile:preferencesFilePath atomically:NO];

}

%end

%hook CardFullInfoEntryViewController

-(void)viewWillAppear:(BOOL)animated {

	%orig;

	NSMutableDictionary *preferences = [NSDictionary dictionaryWithContentsOfFile:preferencesFilePath].mutableCopy;
	if (!preferences) return;

	NSString *passcode = preferences[@"Passcode"];
	if (!passcode) return;

	WRFieldSetView *cell = (WRFieldSetView *)[self.formView.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	cell.textField.text = passcode;

}

-(void)viewWillDisappear:(BOOL)animated {

	%orig;

	NSMutableDictionary *preferences = [NSDictionary dictionaryWithContentsOfFile:preferencesFilePath].mutableCopy;
	if (!preferences) preferences = [[NSMutableDictionary alloc] init];

	WRFieldSetView *cell = (WRFieldSetView *)[self.formView.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	NSString *passcode = cell.textField.text;

	[preferences setObject:passcode forKey:@"Passcode"];
	[preferences writeToFile:preferencesFilePath atomically:NO];

}

%end