
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "ZiXunVC.h"
@interface RootViewC : UIViewController<UIScrollViewDelegate,iCarouselDataSource,iCarouselDelegate>
{
    UIButton*button1;
    UIButton *button2;
    UIButton *button3;
    UIButton *button4;
    UIButton *button5;
}
@property(retain,nonatomic)UIButton*button1;
@property(retain,nonatomic)UIButton*button2;
@property(retain,nonatomic)UIButton*button3;
@property(retain,nonatomic)UIButton*button4;
@property(retain,nonatomic)UIButton*button5;
@property(retain,nonatomic)iCarousel *carousel;

@end
