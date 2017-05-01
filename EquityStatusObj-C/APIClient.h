//
//  APIClient.h
//  EquityStatusObj-C
//
//  Created by Paul Tangen on 5/1/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIClient : NSObject

+ (void)fetchEvalData:(NSDictionary *)sendDict completion:(void (^)(NSString *))completion;

@end
