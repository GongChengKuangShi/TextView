//
//  ViewController.m
//  TextView封装
//
//  Created by xrh on 2017/10/26.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import "ViewController.h"
#import "MKPlaceholderTextView.h"
#import "UIView+MKPExtension.h"

@interface ViewController ()<UITextViewDelegate>/** 文本输入控件 */

@property(nonatomic,weak) MKPlaceholderTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    [self setupTextView];
}

/**
 * 设置导航栏
 */
-(void)setupNav
{
    self.title = @"发表文字";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(post)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    // 强制刷新
    [self.navigationController.navigationBar layoutIfNeeded];
}
/**
 * 设置占位文本
 */
-(void)setupTextView
{
    MKPlaceholderTextView *textView = [[MKPlaceholderTextView alloc]init];
    textView.placeholder = @"说你想说的，做你想做的...";
    textView.frame = self.view.bounds;
    textView.delegate = self;
    [self.view addSubview:textView];
    self.textView = textView;
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.textView becomeFirstResponder];
}
- (void)cancel
{
    NSLog(@"%s",__func__);
}

- (void)post
{
    NSLog(@"%s",__func__);
}

#pragma mark - <UITextViewDelegate>
-(void)textViewDidChange:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem.enabled = textView.hasText;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
@end
