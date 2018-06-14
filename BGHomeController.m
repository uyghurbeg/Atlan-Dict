//
//  BGHomeController.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/26.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGHomeController.h"
#import "BGHome.h"
#import "BGHomeCell.h"
#import "BGDetail.h"

@interface BGHomeController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) UIImageView *background;


@end


@implementation BGHomeController

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
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


//create Datalist
- (NSArray *)dataList
{
    if (_dataList == nil) {


        NSString *plist = [NSString stringWithFormat:@"%@-%@.plist", self.bookNumber, self.unitNumber];
        NSArray *arrayH = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plist ofType:nil]];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in arrayH) {
            BGHome *home = [BGHome homeWithDict:dict];
            [arrayM addObject:home];
        }
        
        self.dataList = arrayM;

    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // all about navigation bar
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.9 alpha:1]];
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"UKIJ Tuz Tor" size:20.0f], NSFontAttributeName, [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1], NSForegroundColorAttributeName, nil]];
    
    //back bar item
    self.navigationItem.hidesBackButton = YES;
    
    
    
    //set back navigation button item
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(backToHome)];
    self.navigationItem.leftBarButtonItem = backItem;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1];
    
    //start from here
    [self tableView];
   
    _tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg4"]];


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    BGHome *home = self.dataList[indexPath.row];
    
    cell.textLabel.text = home.name;
    
    //costumize cell
    UIImageView *cellIndicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_indicator"]];
    cell.accessoryView = cellIndicator;
    
    //set back ground for cell
    UIImageView *bgCell = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_for_cell"]];
    cell.backgroundView = bgCell;
    
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

- (void)backToHome
{
    [self.navigationController popViewControllerAnimated:YES];
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
