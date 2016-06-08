//
//  ViewController.m
//  TextWithImage
//
//  Created by _SS on 16/6/8.
//  Copyright © 2016年 SS. All rights reserved.
//

#import "ViewController.h"
/**
 *  16进制转化颜色
 */
#define UIColorFromRGB(rgbValue,A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextView *contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 40, [UIScreen mainScreen].bounds.size.width - 40.f, 200)];
    contentTextView.attributedText = [self textSetting];
    [self.view addSubview:contentTextView];
}

- (NSAttributedString *)textSetting {
    NSMutableAttributedString *muString = [[NSMutableAttributedString alloc]init];
    
    // color
    NSDictionary *oneDict = @{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:UIColorFromRGB(0xff316b, 1)};
    NSAttributedString *textString = [[NSAttributedString alloc]initWithString:@"改变文字后插入图片" attributes:oneDict];
    [muString appendAttributedString:textString];
    
    // Key parts of image insertion
    NSTextAttachment *attenment = [[NSTextAttachment alloc]init];
    attenment.image = [UIImage imageNamed:@"a_ss_a.png"];
    attenment.bounds = CGRectMake(0, -5, 17, 17);
    NSAttributedString *gift = [NSAttributedString attributedStringWithAttachment:attenment];
    
    [muString appendAttributedString:gift];
    
    // \n auto-wrap
    NSDictionary *twoDict = @{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:UIColorFromRGB(0xfffff, 1)};
    NSAttributedString *twoTextString = [[NSAttributedString alloc]initWithString:@"\n换行后再次插入" attributes:twoDict];
    
    [muString appendAttributedString:twoTextString];
    
    [muString appendAttributedString:gift];
    
    // Set row spacing
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:10];
    [muString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, muString.length)];
    
    
    return muString;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
