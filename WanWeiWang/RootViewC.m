//


#import "RootViewC.h"

@implementation RootViewC
@synthesize button1,button2,button3,button4,button5;
@synthesize carousel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden =YES;
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    img.image =[UIImage imageNamed:@"background_home.png"];
    [self.view addSubview:img];
    [img release];
    
//    UIScrollView* scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 150, 320, 210)];
//    scroll.showsHorizontalScrollIndicator=NO;    //显示水平滚动条
//    scroll.showsVerticalScrollIndicator =NO;    //显示垂直滚动条
//    scroll.bounces  = YES;     //滚动超过边界是否有反弹回来的效果,设置为NO是不会反弹
//    scroll.pagingEnabled =YES;//是否滚动到subView的边界  一页一页的翻
//    scroll.delegate =self;
//    scroll.contentSize =CGSizeMake(320, 210);
//    [self.view addSubview:scroll];
//    [scroll release];
    
//    self.button1 =[[UIButton alloc]initWithFrame:CGRectMake(92, 75, 130, 120)];
//    [button1 setBackgroundImage:[UIImage imageNamed:@"check_home.png"] forState:UIControlStateNormal];
//    [scroll addSubview:button1];
//    [button1 release];
//    button2=[[UIButton alloc]initWithFrame:CGRectMake(28, 50, 80, 80)];
//    [button2 setBackgroundImage:[UIImage imageNamed:@"exam_home.png"] forState:UIControlStateNormal];
//    [scroll addSubview:button2];
//    [button2 release];
//    button3=[[UIButton alloc]initWithFrame:CGRectMake(0, 10, 50, 50)];
//    [button3 setBackgroundImage:[UIImage imageNamed:@"con_home.png"] forState:UIControlStateNormal];
//    [scroll addSubview:button3];
//    [button3 release];
//    button4=[[UIButton alloc]initWithFrame:CGRectMake(210, 50, 80, 80)];
//    [button4 setBackgroundImage:[UIImage imageNamed:@"infor_home.png"] forState:UIControlStateNormal];
//    [scroll addSubview:button4];
//    [button4 release];
//    button5=[[UIButton alloc]initWithFrame:CGRectMake(270, 10, 50, 50)];
//    [button5 setBackgroundImage:[UIImage imageNamed:@"seting_home.png"] forState:UIControlStateNormal];
//    [scroll addSubview:button5];
//    [button5 release];
    self.carousel =[[iCarousel alloc]initWithFrame:CGRectMake(0, 150, 320, 210)];
    carousel.backgroundColor =[UIColor orangeColor];
    self.carousel.delegate =self;
    self.carousel.dataSource=self;
    carousel.type =iCarouselTypeRotary;
    carousel.perspective= -0.005;
    carousel.centerItemWhenSelected =YES;
    [self.view addSubview:carousel];
    [carousel release];
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    if (index==3) {
        ZiXunVC*zixun =[[ZiXunVC alloc]init];
        [self.navigationController pushViewController:zixun animated:YES];
    }
}
//在旋转木马的项的数量
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 5;
}
//木马视图的索引项
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    UIView *view = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"home%d.png",index]]] autorelease];
    view.frame = CGRectMake(92, 75, 130, 120);
    
    return view;
}
//占位符的数量在旋转木马
- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
	return 0;
}
//可见物品的数量在旋转木马
- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    return 30;
}
- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0) ;
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = self.carousel.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * carousel.itemWidth);
}
//旋转木马项宽度
- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return 200;
}
//旋转木马边界
- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    return YES;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden =YES;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end

