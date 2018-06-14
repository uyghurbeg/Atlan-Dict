//
//  BGBookListController.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/27.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGBookListController.h"
#import "BGHomeController.h"

@interface BGBookListController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *bookList;
@property (nonatomic, strong) UIImageView *background;


@end


@implementation BGBookListController


- (UIImageView *)background
{
    if (_background == nil) {
        _background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
        _background.frame = self.view.bounds;
        
        [self.view addSubview:_background];
    }
    return _background;
}

//laijiazai tableview
- (UITableView *)tableView
{
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


//create Datalist
- (NSMutableArray *)bookList
{
    if (_bookList == nil) {
        
        self.bookList = [NSMutableArray array];
        
        NSString *string = [NSString stringWithFormat:@"%@-menu.plist", self.number];
        
        NSArray *arrayM = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:string ofType:nil]];
    
        self.bookList = arrayM;
       
    }
    
    return _bookList;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // all about navigation bar
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.9 alpha:1]];
    NSString *titleStr = [NSString stringWithFormat:@"Mini Dictionary %@", self.number];
    self.navigationItem.title = titleStr;
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"UKIJ Tuz Tor" size:20.0f], NSFontAttributeName, [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1], NSForegroundColorAttributeName, nil]];
    
    //back bar item
    self.navigationItem.hidesBackButton = YES;
    
    //set back navigation button item
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(backToHome)];
    self.navigationItem.leftBarButtonItem = backItem;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1];

    
    NSLog(@"%@", self.title);
    
    //start from here
    [self tableView];
    
    _tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg4"]];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bookList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
        long int i = indexPath.row;
        NSString *titleStr = [NSString stringWithFormat:@"Book %@ %@ %ld", self.number, self.bookList[indexPath.row], i+1];
        cell.textLabel.text = titleStr;
        cell.textLabel.textColor = [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1];
        cell.textLabel.font = [UIFont italicSystemFontOfSize:18.0f];
    

   
    
    //costumize cell
    UIImageView *cellIndicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_indicator"]];
    cell.accessoryView = cellIndicator;
    
    //set back ground for cell
    UIImageView *bgCell = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_for_cell"]];
    cell.backgroundView = bgCell;
    
    return cell;
}

- (void)backToHome
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BGHomeController *homeVC = [[BGHomeController alloc] init];
    NSString *titleStr = [NSString stringWithFormat:@"Book %@ Unit %i", self.number, indexPath.row + 1];
    homeVC.navigationItem.title = titleStr;
    NSString *untNumber = [NSString stringWithFormat:@"%i", indexPath.row + 1];
    homeVC.unitNumber = untNumber;
    homeVC.bookNumber = self.number;

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:homeVC animated:YES];
}

@end
