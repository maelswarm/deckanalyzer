//
//  MyTableViewCell.m
//  mtgdeckanalysis
//
//  Created by Brandon Barber on 6/7/15.
//  Copyright (c) 2015 Brandon Barber. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.imgArray = [NSMutableArray new];
        
        self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 53.333, 80)];
        [self.imgArray addObject:self.imageView1];
        [self.contentView addSubview:self.imageView1];
        
        self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(53.333, 10, 53.333, 80)];
        [self.imgArray addObject:self.imageView2];
        [self.contentView addSubview:self.imageView2];
        
        self.imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(53.333*2.0, 10, 53.333, 80)];
        [self.imgArray addObject:self.imageView3];
        [self.contentView addSubview:self.imageView3];
        
        self.imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(53.333*3.0, 10, 53.333, 80)];
        [self.imgArray addObject:self.imageView4];
        [self.contentView addSubview:self.imageView4];
        
        self.imageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(53.333*4.0, 10, 53.333, 80)];
        [self.imgArray addObject:self.imageView5];
        [self.contentView addSubview:self.imageView5];
        
        self.imageView6 = [[UIImageView alloc] initWithFrame:CGRectMake(53.333*5.0, 10, 53.333, 80)];
        [self.imgArray addObject:self.imageView6];
        [self.contentView addSubview:self.imageView6];
        
        self.imageView7 = [[UIImageView alloc] initWithFrame:CGRectMake(53.333*6.0, 10, 53.333, 80)];
        [self.imgArray addObject:self.imageView7];
        [self.contentView addSubview:self.imageView7];
    }
    
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
