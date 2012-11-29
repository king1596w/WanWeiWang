
//  Created by Ibokan on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZiXunVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableVl;
}
@property(retain,nonatomic)UITableView*tableVl;

@end
