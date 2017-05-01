//
//  APIClient.m
//  EquityStatusObj-C
//
//  Created by Paul Tangen on 5/1/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

#import "APIClient.h"
#import "DataStore.h"

@interface APIClient ()

@property (strong, nonatomic) DataStore *datastore;

@end

@implementation APIClient

+ (void)fetchEvalData:(NSDictionary *)sendDict completion:(void (^)(NSString *))completion {
    
    DataStore *datastore = [DataStore sharedManager];
    
    NSURL *URL = [NSURL URLWithString:@"http://api.ptangen.com/equityStatus/getEquities.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    // Convert POST string parameters to data using UTF8 Encoding
    NSString *postParams = @"key=6032768233&mode=pass,noData&ByTarget=SomePass";
    NSData *postData = [postParams dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        // put results into an array
        NSArray *dataJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        // put objects in array into dictionary and then extract values
        for(NSDictionary *company in dataJSON) {
            NSString *name =[company objectForKey:@"Name"];
            [datastore.content addObject:name];
        }

        // return status
        if(error.code == 0) {
            completion(@"OK");
        } else {
            completion(error.description);
        }
    }];
    [dataTask resume];
}

@end
