//
//  EvaluationViewController.m
//  EquityStatusObj-C
//
//  Created by Paul Tangen on 5/1/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

#import "EvaluationViewController.h"
#import "DataStore.h"
#import "APIClient.h"

@interface EvaluationViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *evalTableView;
@property (strong, nonatomic) DataStore *datastore;

@end

@implementation EvaluationViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datastore = [DataStore sharedManager];

    NSDictionary *testDict;
    
    [APIClient fetchEvalData:testDict completion:^(NSString *results) {
        if(![results isEqual: @"OK"]) {
            NSLog(@"Error fetching eval companies. Message = %@", results);  // TODO: Put error message in alert
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.evalTableView reloadData]; // put reload on the main queue
            });
        }
    }];
                      
    self.evalTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.evalTableView.delegate = self;
    self.evalTableView.dataSource = self;
    [self.view addSubview:self.evalTableView];
    [self.evalTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
    
    [self pageLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datastore.content count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //FISLocation *location = (FISLocation *)self.locations[indexPath.row];
    cell.textLabel.text = self.datastore.content[indexPath.row];
    
    return cell;
}

- (void) pageLayout {
    // tableview
    self.evalTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //leading
    NSLayoutConstraint *leading = [NSLayoutConstraint
                                   constraintWithItem: self.evalTableView
                                   attribute: NSLayoutAttributeLeading
                                   relatedBy: NSLayoutRelationEqual
                                   
                                   toItem: self.view
                                   attribute: NSLayoutAttributeLeading
                                   multiplier: 1.0f
                                   constant: 10.f];
    
    // trailing
    NSLayoutConstraint *trailing = [NSLayoutConstraint
                                    constraintWithItem: self.evalTableView
                                    attribute: NSLayoutAttributeTrailing
                                    relatedBy: NSLayoutRelationEqual
                                    
                                    toItem: self.view
                                    attribute: NSLayoutAttributeTrailing
                                    multiplier: 1.0f
                                    constant: -10.f];
    
    //top
    NSLayoutConstraint *top =[NSLayoutConstraint
                              constraintWithItem: self.evalTableView
                              attribute: NSLayoutAttributeTop
                              relatedBy: NSLayoutRelationEqual
                              
                              toItem: self.view
                              attribute: NSLayoutAttributeTop
                              multiplier: 1.0f
                              constant: 100.f];
    
    //bottom
    NSLayoutConstraint *bottom =[NSLayoutConstraint
                                 constraintWithItem: self.evalTableView
                                 attribute: NSLayoutAttributeBottom
                                 relatedBy: NSLayoutRelationEqual
                                 
                                 toItem: self.view
                                 attribute: NSLayoutAttributeBottom
                                 multiplier: 1.0f
                                 constant: 0.f];
    
    [self.view addConstraint:leading];
    [self.view addConstraint:trailing];
    [self.view addConstraint:top];
    [self.view addConstraint:bottom];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
