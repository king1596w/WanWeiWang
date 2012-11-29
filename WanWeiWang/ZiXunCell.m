//

#import "ZiXunCell.h"

@implementation ZiXunCell
@synthesize content,head,pictrue;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.pictrue =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"文件.png"]];
        [self addSubview:pictrue];
        [pictrue release];
        self.content =[[UILabel alloc]init];
        [self addSubview:content];
        [content release];
        self.head =[[UILabel alloc]init];
        [self addSubview:head];
        [head release];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
