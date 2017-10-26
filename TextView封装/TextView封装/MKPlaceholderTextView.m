//
//  MKPlaceholderTextView.m
//  TextView封装
//
//  Created by xrh on 2017/10/26.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import "MKPlaceholderTextView.h"
#import "UIView+MKPExtension.h"

@interface MKPlaceholderTextView ()

@property(strong, nonatomic) UILabel *placeholderLabel;

@end

@implementation MKPlaceholderTextView

- (UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.x = 4;
        label.y = 7;
        [self addSubview:label];
        _placeholderLabel = label;
    }
    return _placeholderLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 垂直方向上永远有弹簧效果
        self.alwaysBounceVertical = YES;
        
        //默认文字
        self.font = [UIFont systemFontOfSize:15];
        
        //默认的占位文字颜色
        self.placeholderColor = [UIColor grayColor];
        
        //监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textDidChange {
    
    //只要有文字，就隐藏占位文字label
    self.placeholderLabel.hidden = self.hasText;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.placeholderLabel.width = self.width - 2 * self.placeholderLabel.x;
    [self.placeholderLabel sizeToFit];
}


- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = placeholderColor;
}

-(void)setPlaceholder:(NSString *)placeholder {
    _placeholderColor = [placeholder copy];
    self.placeholderLabel.text = placeholder;
    [self setNeedsLayout];
}

-(void)setFont:(UIFont *)font {
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    [self setNeedsLayout];
}

-(void)setText:(NSString *)text {
    [super setText:text];
    
    [self textDidChange];
}

-(void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}

@end
