#import <UIKit/UIKit.h>

%hook UIDevice

- (NSString *)systemVersion {
    NSString *version = [NSString stringWithContentsOfFile:@"/var/mobile/FakeIOSVersion/version.txt" encoding:NSUTF8StringEncoding error:nil];
    if (version && version.length > 0) {
        return [version stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return %orig;
}

%end
