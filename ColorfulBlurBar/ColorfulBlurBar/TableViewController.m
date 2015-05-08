//
//  TableViewController.m
//  ColorfulBlurBar
//
//  Created by gaoqiang xu on 5/8/15.
//  Copyright (c) 2015 SealedCompany. All rights reserved.
//

#import "TableViewController.h"

@interface SACell : UITableViewCell
@property (strong, nonatomic) UIImageView *contentImageView;
@end

@implementation SACell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
        self.contentImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.contentImageView];
        
        NSArray *layouts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_contentImageView]-10-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:NSDictionaryOfVariableBindings(_contentImageView)];
        [self.contentView addConstraints:layouts];
        
        layouts = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_contentImageView]-10-|"
                                                          options:0
                                                          metrics:nil
                                                            views:NSDictionaryOfVariableBindings(_contentImageView)];
        
        [self.contentView addConstraints:layouts];
    }
    
    return self;
}

@end

@interface TableViewController ()
<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation TableViewController

- (void)loadView
{
    [super loadView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_tableView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_tableView)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_tableView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_tableView)]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[SACell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SACell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    BOOL f = indexPath.row % 2;
    
    UIImage *image = [UIImage imageNamed:f?@"1.jpg":@"2.jpg"];
    cell.contentImageView.image = image;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.f;
}

@end
