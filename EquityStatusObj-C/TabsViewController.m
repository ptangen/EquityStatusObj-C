//
//  TabsViewController.m
//  EquityStatusObj-C
//
//  Created by Paul Tangen on 5/1/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

#import "TabsViewController.h"

@interface TabsViewController ()

@end

@implementation TabsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    self.title = @"Equity Status";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
