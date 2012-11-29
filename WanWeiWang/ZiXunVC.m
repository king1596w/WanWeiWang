//
//  ZiXunVC.m
//  WanWeiWang

#import "ZiXunVC.h"
#import "ZiXunCell.h"
@implementation ZiXunVC
@synthesize tableVl;
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
/*
- (void)loadView
{}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    self.navigationItem.title =@"域名资讯";
    NSArray* array=[[NSArray alloc]initWithObjects:@"最新",@"行业",@"应用",@"价值",@"安全", nil];
    UISegmentedControl*segment =[[UISegmentedControl alloc]initWithItems:array];
    segment.segmentedControlStyle =UISegmentedControlStylePlain;
    [segment setBackgroundImage:[UIImage imageNamed:@"横条背景.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    segment.frame =CGRectMake(0, 0, 320, 30);
    segment.selectedSegmentIndex =0;
    [self.view addSubview:segment];
    [array release];
    [segment release];
    
    UIImageView*beijing =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 460-44-30)];
    beijing.image =[UIImage imageNamed:@"suffix_background.png"];
    self.tableVl =[[UITableView alloc]initWithFrame:CGRectMake(0, 30, 320, 460-30-44)];
    [tableVl setBackgroundView:beijing];
    [beijing release];
    tableVl.delegate =self;
    tableVl.dataSource =self;
    [self.view addSubview:tableVl];
    [tableVl release];
}
#pragma mark ==表格代理=
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZiXunCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[ZiXunCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    
    return cell;
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
