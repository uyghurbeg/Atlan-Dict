//
//  BGinfoMoreController.m
//  FakeAtlan
//
//  Created by UyghurbegPro on 15/12/28.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGinfoMoreController.h"

@interface BGinfoMoreController ()

@property (nonatomic, strong) UIImageView *background;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation BGinfoMoreController

- (UIImageView *)background
{
    if (_background == nil) {
        _background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_without_logo"]];
        _background.contentMode = UIViewContentModeScaleToFill;
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
        CGFloat x = 0;
        CGFloat y = 60;
        CGFloat w = self.view.bounds.size.width;
        CGFloat h = self.view.bounds.size.height - y;
        _textView.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:_textView];
        
    }
    return _textView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self background];
    
    
    //set back navigation button item
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(backToHome)];
    self.navigationItem.leftBarButtonItem = backItem;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1];

 //navigation item
 [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.9 alpha:1]];
 self.navigationItem.title = @"ئەپ ھەققىدە";
 [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"UKIJ Tuz Tor" size:20.0f], NSFontAttributeName, [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1], NSForegroundColorAttributeName, nil]];
 
 
 self.textView.text = self.moreString;
 self.textView.backgroundColor = [UIColor clearColor];
 self.textView.editable = NO;
 self.textView.scrollEnabled = YES;
 self.textView.selectable = NO;
 self.textView.font = [UIFont fontWithName:@"UKIJ Tuz Tor" size:20.0f];
 self.textView.textColor = [UIColor colorWithRed:0.4 green:0.26 blue:0.46 alpha:1];
 self.textView.textAlignment = NSTextAlignmentRight;
 

    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)backToHome
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
