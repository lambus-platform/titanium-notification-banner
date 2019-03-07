/**
 * titanium-notification-banner
 *
 * Created by Your Name
 * Copyright (c) 2018 Your Company. All rights reserved.
 */

#import "TiNotificationbannerModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiNotificationbannerModule

#pragma mark Internal

// This is generated for your module, please do not change it
- (id)moduleGUID
{
  return @"add9865d-fbad-468b-b044-ba9888544dcc";
}

- (NSString *)moduleId
{
  return @"ti.notificationbanner";
}

#pragma mark Lifecycle

- (void)startup
{
  [super startup];
  DebugLog(@"[DEBUG] %@ loaded", self);
}

#pragma Public APIs

- (void)show:(id)args
{
  ENSURE_SINGLE_ARG(args, NSDictionary);

  NSString *title = args[@"title"];
  NSString *subtitle = args[@"subtitle"];
  double duration = [TiUtils doubleValue:@"duration" properties:args def:1.0];
  UIImage *image = [TiUtils image:args[@"image"] proxy:self];
  UIColor *backgroundColor = [TiUtils colorValue:@"backgroundColor" properties:args].color;
  Banner *banner = [[Banner alloc] initWithTitle:title
                                        subtitle:subtitle
                                           image:image
                                 backgroundColor:backgroundColor
                                     didTapBlock:^{ /* Unused */ }];
  banner.dismissesOnTap = YES;
  [banner show:nil duration:duration];
}

@end
