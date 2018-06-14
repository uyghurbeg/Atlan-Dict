//
//  BGBiglistController.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/27.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGBiglistController.h"
#import "BGBookListController.h"
#import "BGBiglistModal.h"

@interface BGBiglistController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *bigList;
@property (nonatomic, strong) UIImageView *background;


@end


@implementation BGBiglistController

//

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
        CGFloat x = 0;
        CGFloat y = 10;
        CGFloat w = self.view.bounds.size.width;
        CGFloat h = self.view.bounds.size.height;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(x, y, w, h) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)bigList
{
    if (_bigList == nil) {
        _bigList = [[NSArray alloc] init];
        
        BGBiglistModal *list1 = [BGBiglistModal biglistWithIcon:@"one" title:@"1"];
        BGBiglistModal *list2 = [BGBiglistModal biglistWithIcon:@"two" title:@"2"];
        BGBiglistModal *list3 = [BGBiglistModal biglistWithIcon:@"three" title:@"3"];
        BGBiglistModal *list4 = [BGBiglistModal biglistWithIcon:@"four" title:@"4"];
        BGBiglistModal *list5 = [BGBiglistModal biglistWithIcon:@"five" title:@"5"];
        BGBiglistModal *list6 = [BGBiglistModal biglistWithIcon:@"six" title:@"6"];
        BGBiglistModal *list7 = [BGBiglistModal biglistWithIcon:@"seven" title:@"7"];
        BGBiglistModal *list8 = [BGBiglistModal biglistWithIcon:@"eight" title:@"8"];

        _bigList = @[list1, list2, list3, list4, list5, list6, list7, list8];
    }
    return _bigList;
}


//create Datalist

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // all about navigation bar
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.9 alpha:1]];
    self.navigationItem.title = @"باشبەت";
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"UKIJ Tuz Tor" size:20.0f], NSFontAttributeName, [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1], NSForegroundColorAttributeName, nil]];
    
    //back bar item
    self.navigationItem.hidesBackButton = YES;
    
    
    
    
    //start from here
    [self tableView];
    
    _tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg4"]];
    _tableView.rowHeight = 60;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bigList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    BGBiglistModal *modal = self.bigList[indexPath.row];
    NSString *titleStr = [NSString stringWithFormat:@"Atlan Dict. Book No.%@", modal.title];
    cell.textLabel.text = titleStr;
    cell.textLabel.textColor = [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1];
    cell.textLabel.font = [UIFont italicSystemFontOfSize:18.0f];
    cell.imageView.image = [UIImage imageNamed:modal.icon];
    
    //set back ground for cell
    UIImageView *bgCell = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_for_cell"]];
    cell.backgroundView = bgCell;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BGBiglistModal *modal = self.bigList[indexPath.row];
    
    
    BGBookListController *smallList = [[BGBookListController alloc] init];
    smallList.number = modal.title;
    [self.navigationController pushViewController:smallList animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

@end
