//
//  ViewController.m
//  WebPDemo
//
//  Created by Admin on 2017/12/25.
//  Copyright © 2017年 WENBO. All rights reserved.
//

#import "ViewController.h"
#import "YYWebImage.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /** << 1、本地加载 > */
//    NSString *path = [[NSBundle mainBundle] pathForAuxiliaryExecutable:@"test.webp"];
//    _imageView.yy_imageURL = [NSURL fileURLWithPath:path];
    /** << 2、网络加载 > */
    _imageView.yy_imageURL = [NSURL URLWithString:@"https://user-gold-cdn.xitu.io/2017/12/28/1609d17b5af17a56?w=534&h=300&f=webp&s=39334"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
