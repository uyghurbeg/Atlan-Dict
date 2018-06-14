//
//  BGSavedController.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/26.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGSavedController.h"
#import "BGDetail.h"
#import "BGHome.h"
#import "BGSave.h"

@interface BGSavedController ()<UITableViewDataSource, UITableViewDelegate>


@end

@implementation BGSavedController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableDictionary *)dataDict
{
    if (_dataDict == nil) {
        _dataDict = [NSMutableDictionary dictionary];
    }
    return _dataDict;
}

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        
        _dataList = [NSMutableArray array];
        
        [_dataList addObjectsFromArray:[BGSave save]];
    }
    return _dataList;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //navigation bar
        [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.9 alpha:1]];
    self.navigationItem.title = @"سۆزلۈك ئامبىرىم";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"UKIJ Tuz Tor" size:20.0f], NSFontAttributeName, [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1], NSForegroundColorAttributeName, nil]];

    //start table view
    [self tableView];
    [self.tableView reloadData];
    
    UIImageView  *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_without_logo"]];
    _tableView.backgroundView = bg;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d",self.dataList.count);
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    BGSave *save = self.dataList[indexPath.row];

    cell.textLabel.text = save.name;;
    
  
    UIImageView  *indicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_indicator"]];
    cell.accessoryView = indicator;
    UIImageView  *cellBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_for_cell"]];
    cell.backgroundView = cellBg;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BGHome *home = self.dataList[indexPath.row];
    
    BGDetail *destVC = [[BGDetail alloc] init];
    destVC.hidesBottomBarWhenPushed = YES;
    destVC.nameText = home.name;
    destVC.articleText = home.pram;
    destVC.soundText = home.pron;
    destVC.cnText = home.han;
    destVC.ugText = home.uyghur;
    destVC.explainText = home.definition;
    destVC.exampleText = @"example";
    destVC.sentenceText = home.exam;
    
    [self.navigationController pushViewController:destVC animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_dataList removeObjectAtIndex:indexPath.row];
    [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    
}

@end
