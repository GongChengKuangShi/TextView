//
//  MKPlaceholderTextView.h
//  TextView封装
//
//  Created by xrh on 2017/10/26.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKPlaceholderTextView : UITextView

@property (copy, nonatomic) NSString *placeholder;
@property(strong, nonatomic) UIColor *placeholderColor;

@end
