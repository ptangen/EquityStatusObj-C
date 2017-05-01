//
//  EvaluationViewController.m
//  EquityStatusObj-C
//
//  Created by Paul Tangen on 5/1/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

#import "EvaluationViewController.h"

@interface EvaluationViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *evalTableView;
@property (strong,nonatomic) NSArray     *content;

@end

@implementation EvaluationViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.content = @[ @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday"];
                      
    self.evalTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.evalTableView.delegate = self;
    self.evalTableView.dataSource = self;
    [self.view addSubview:self.evalTableView];
    [self.evalTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.content count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //FISLocation *location = (FISLocation *)self.locations[indexPath.row];
    cell.textLabel.text = self.content[indexPath.row];
    
    return cell;
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
