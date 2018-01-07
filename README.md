# -WebP
Let your project support webp image.

### 前言
> 最近在公司做类似与朋友圈动态展示图片的时候，无意间接触到了[WebP](https://baike.baidu.com/item/webp%E6%A0%BC%E5%BC%8F/4077671)格式图片。WebP 的优势体现在它具有更优的图像数据压缩算法，能带来更小的图片体积，而且拥有肉眼识别无差异的图像质量；同时具备了无损和有损的压缩模式、Alpha 透明以及动画的特性，在 JPEG 和 PNG 上的转化效果都相当优秀、稳定和统一。下面开始介绍几种让工程支持WebP方法吧😀。

### 一、通过[SDWebImage](https://github.com/rs/SDWebImage)三方图片加载库实现
#### 1、通过CocoaPods方式
在工程的podfile中添加
```
pod 'SDWebImage'
pod 'SDWebImage/WebP'
```
**注意**：
因为libwebp(0.5.1)是谷歌的库，下载需要翻墙。通常会报以下错误，如果确实下不下来，只能通过手动方式导入相关库了：
![屏幕快照 2017-12-25 下午9.28.51.png](https://user-gold-cdn.xitu.io/2017/12/25/1608e2bf7b3fd7a0?w=1146&h=536&f=png&s=106020)

#### 2、手动导入方式
1、将SDWebImage(4.1.0)拖入到工程，如下图：
![屏幕快照 2017-12-25 下午9.28.05.png](https://user-gold-cdn.xitu.io/2017/12/25/1608e2bf84924442?w=532&h=1162&f=png&s=213401)
2、下载[libwebp](http://downloads.webmproject.org/releases/webp/index.html)库（需要翻墙）
我下的版本是0.5.1没有打包成framework，所以我把自己也尝试将库文件打包成静态framework，打包出来目录如下：
![屏幕快照 2017-12-25 下午9.59.18.png](https://user-gold-cdn.xitu.io/2017/12/25/1608e2bf7aff46b6?w=524&h=528&f=png&s=66018)
3、 设置target－>build setting－>搜索preprocessor 添加SD_WEBP=1,如下图：
![屏幕快照 2017-12-25 下午10.03.00.png](https://user-gold-cdn.xitu.io/2017/12/25/1608e2bf7b1880ee?w=1240&h=689&f=png&s=192119)
好了，配置已经完成，现在工程已经支持WebP显示了，我的项目里都是加载的网络WebP格式图片，我写了一个[WebPDemo_Method1](https://github.com/wenmobo/WebP/tree/master/WebPDemo_Method1)能够显示本地WebP图片。在我的电脑能翻墙的时候也把其他版本的libwebp库([libwebp_V0.5.1](https://github.com/wenmobo/WebP/blob/master/libwebp/libwebp_V0.5.1.zip)、[ibwebp_V0.5.2](https://github.com/wenmobo/WebP/blob/master/libwebp/libwebp_V0.5.2.zip)、[libwebp_V0.6.0](https://github.com/wenmobo/WebP/blob/master/libwebp/libwebp_V0.6.0.zip))下了下来,0.5.1是我自己打的包，另外两个版本是官方打好的包，有需要的可以自行下载相应的版本。

**注意**
1、导入工程的libwebp库，不一定非要framework,也可以就把相应的库文件导入到工程，只需要注意头文件导入名称就可以了。
2、demo中，我并没有用SDWebImage(4.1.0)的原UIImage+WebP.h和UIImage+WebP.m文件，而是对头文件做了一定修改，如果工程用最新的SDWebImage报错，可以用我demo中UIImage+WebP文件下的两个文件。
### 报错解决
1、我自己打的静态库framework在工程运行时报错，因为framework用到了系统的库。
```
－－include of non-modular header inside XXXX
```
解决办法是：Allow Non-modular includes in Framework Modules 设置为YES，如下图：
![屏幕快照 2017-12-25 下午10.27.58.png](https://user-gold-cdn.xitu.io/2017/12/25/1608e2bf7badd3bf?w=1240&h=335&f=png&s=101766)
重新运行工程，没有报错，可以正常显示WebP格式图片了。

### 二、通过[YYWebImage](https://github.com/ibireme/YYWebImage)(2017-12-28更新)
最近在看YYKit组件的时候，发现YYWebImage也支持webp格式片，集成使用也相当方便。
#### 1、CocoaPods导入
```
pod 'YYWebImage'
pod 'YYImage/WebP`
```
#### 2、手动导入
将YYWebImage和vendor文件夹拖入到工程。目录结构如下：

![](https://user-gold-cdn.xitu.io/2017/12/28/1609d2b769e05a5e?w=490&h=560&f=png&s=131090)
#### 具体使用
- 导入头文件
```
#import "YYWebImage.h"
或
#import <YYWebImage.h>
```
- 设置图片地址
```
/** << 1、本地加载 > */
//    NSString *path = [[NSBundle mainBundle] pathForAuxiliaryExecutable:@"test.webp"];
//    _imageView.yy_imageURL = [NSURL fileURLWithPath:path];
/** << 2、网络加载 > */
_imageView.yy_imageURL = [NSURL URLWithString:@"https://user-gold-cdn.xitu.io/2017/12/28/1609d17b5af17a56?w=534&h=300&f=webp&s=39334"];
```
好了，通过YYWebImage也实现了webp格式图片的显示，要查看更多YYWebImage的用法，可以到GitHub上查看使用文档。顺便也贴出测试[WebPDemo_Method2](https://github.com/wenmobo/WebP/tree/master/WebPDemo_Method2)。

**测试图片(webp格式)**

![](https://user-gold-cdn.xitu.io/2017/12/28/1609d17b5af17a56?w=534&h=300&f=webp&s=39334)
### 总结
> 当然，支持WebP显示的方法也不止通过三方库的方式，也可以通过webView方式，还可以通过NSURLProtocol方式，如果需要用到以上两种方式，可以自行研究一下。如果大家有更好的方法或者建议，欢迎大家一起讨论。
### 参考文章
1、[webP 格式图片在 iOS 中的应用](https://www.jianshu.com/p/ed7562a34af1)
2、[SDWebImage支持webp格式的图片](http://blog.csdn.net/shenjx1225/article/details/47259701)
3、[ios开发中报错处理－－include of non-modular header inside XXXX](http://blog.csdn.net/zzzzzdddddxxxxx/article/details/51149243)
4、[How to support webp? ](https://github.com/rs/SDWebImage/issues/1122)
