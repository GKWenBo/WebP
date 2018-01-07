//
//  ViewController.m
//  WebPDemo
//
//  Created by Admin on 2017/12/25.
//  Copyright © 2017年 WENBO. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /** << 1、本地webp格式图片 > */
//    NSString *path = [[NSBundle mainBundle] pathForAuxiliaryExecutable:@"test.webp"];
//    [_imageView sd_setImageWithURL:[NSURL fileURLWithPath:path]];
    
    /** << 2、网络加载webp图片 > */
    [_imageView sd_setImageWithURL:[NSURL URLWithString:@"https://user-gold-cdn.xitu.io/2017/12/28/1609d17b5af17a56?w=534&h=300&f=webp&s=39334"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
