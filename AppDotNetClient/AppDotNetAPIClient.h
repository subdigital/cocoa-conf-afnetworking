//
//  AppDotNetAPIClient.h
//  AppDotNetClient
//
//  Created by Ben Scheirman on 10/19/12.
//  Copyright (c) 2012 foo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AppDotNetAPIClient : AFHTTPClient

+ (id)sharedAPIClient;

@end
