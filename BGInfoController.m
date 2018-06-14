//
//  BGInfoController.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/26.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGInfoController.h"
#import "BGinfoMoreController.h"

@interface BGInfoController ()

@property (nonatomic, strong) UIButton *logoButton;
@property (nonatomic, strong) UIImageView *background;
@property (nonatomic, strong) NSMutableDictionary *dict;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation BGInfoController
- (UIImageView *)background
{
    if (_background == nil) {
        _background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg4"]];
        _background.contentMode = UIViewContentModeScaleAspectFit;
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat w = self.view.bounds.size.width;
        CGFloat h = self.view.bounds.size.height;
        
        _background.frame = CGRectMake(x, y, w, h);
        
        [self.view addSubview:_background];
    }
    return _background;
}


- (UITextView *)textView
{
    if (_textView == nil) {
        _textView = [[UITextView alloc] init];
        CGFloat labelW = self.view.bounds.size.width;
        CGFloat labelH = self.view.bounds.size.height / 2;
        _textView.frame = CGRectMake(20, 60, labelH, labelW);
        [self.view addSubview:_textView];

    }
    return _textView;
}

- (NSMutableDictionary *)dict
{
    if (_dict == nil) {
        
        self.dict = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"about.plist" ofType:nil]];
    }
    return _dict;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self background];

    //navigation item
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.9 alpha:1]];
    self.navigationItem.title = @"ئەپ ھەققىدە";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"UKIJ Tuz Tor" size:20.0f], NSFontAttributeName, [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1], NSForegroundColorAttributeName, nil]];
    
    //hide backbar button
    self.navigationItem.hidesBackButton = YES;
    
    
    NSString *string = self.dict[@"shortText"];
    self.textView.text = string;
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.editable = NO;
    self.textView.scrollEnabled = NO;
    self.textView.selectable = NO;
    self.textView.font = [UIFont fontWithName:@"UKIJ Tuz Tor" size:18.0f];
    self.textView.textColor = [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1];
    self.textView.textAlignment = NSTextAlignmentJustified;
    
    
    CGFloat buttonY = CGRectGetMaxY(self.textView.frame);
    CGFloat buttonX = 0;
    CGFloat buttonH = self.view.bounds.size.height - buttonY;
    CGFloat buttonW = self.view.bounds.size.width;
    
    UIButton *buttonBottom = [[UIButton alloc] init];
    buttonBottom.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    [buttonBottom addTarget:self action:@selector(goToMoreInfo) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonBottom];

    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)goToMoreInfo
{
    BGinfoMoreController *more = [[BGinfoMoreController alloc] init];
    more.hidesBottomBarWhenPushed = YES;
    more.moreString = self.dict[@"longText"];
    
    [self.navigationController pushViewController:more animated:YES];
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
