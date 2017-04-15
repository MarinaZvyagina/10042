//
//  ViewController.m
//  10042
//
//  Created by iOS-School-1 on 11.04.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, copy) NSArray *animals;
@property (nonatomic, copy) NSTimer *timer;


@end

@implementation ViewController

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Table";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

    [self createModel];
    self.tableView = [UITableView new];
    
    self.tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.tableFooterView = [UIView new];
    
    [self.view addSubview:self.tableView];
 
    _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:[NSBlockOperation blockOperationWithBlock:^{
        self.animals = [self getMeat];
        [self.timer invalidate];
        [self.tableView reloadData];
    }]
        selector:@selector(main)
        userInfo:nil
        repeats:NO  ];
    
}
- (NSArray *) getMeat {
    return @ [ @"Cat",
               @"Dog",
             ];
}

- (void)createModel {
    self.animals = @ [ @"Cat",
                       @"Dog",
                       @"Pig",
                       @"Fish",
                       @"Bird"
                      ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.animals[indexPath.row];//[NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [UIViewController new];
    
    vc.view.backgroundColor = UIColor.redColor;
    vc.navigationItem.title = [NSString stringWithFormat:@"%ld", indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
