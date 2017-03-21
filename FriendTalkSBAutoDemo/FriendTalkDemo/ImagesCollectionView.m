//
//  ImagesCollectionView.m
//  FriendTalkDemo
//
//  Created by huhaifeng on 2017/3/18.
//  Copyright © 2017年 huhaifeng. All rights reserved.
//

#import "ImagesCollectionView.h"
#import "ImagesCollectionCell.h"
@implementation ImagesCollectionView

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self initDelegate];
}

- (void)setAttachmentType:(AttachmentType)attachmentType
{
    _attachmentType =attachmentType;
    [self setContentSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
}


- (void)setVideo:(XHVideoImageModel *)video
{
    _video =video;

    [self reloadData];
}

- (void)setImages:(NSArray<XHVideoImageModel *> *)images
{
    _images =images;

    [self reloadData];
}

#pragma mark UICollectionViewDataSource
/**
 返回section个数
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.attachmentType ==imageAttachmentType)
    {
        if ([self.images count]==4)
        {
            return 2;
        }
        
    }
    return 1;
}

/**
 返回每个section的item个数
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.attachmentType ==imageAttachmentType)
    {
        return [self.images count];
    }
    return 1;
}

/**
 返回Cell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImagesCollectionCell *cell = [self dequeueReusableCellWithReuseIdentifier:@"ImagesCollectionCell" forIndexPath:indexPath];
    if (self.attachmentType ==imageAttachmentType)
    {
        [cell.imageView setImageWithURL:[NSURL URLWithString:self.images[indexPath.row].imageSmallUrl] placeholder:[UIImage imageNamed:@"defaultAvatar"]];
    }
    else
    {
        [cell.imageView setImageWithURL:[NSURL URLWithString:self.video.imageSmallUrl] placeholder:[UIImage imageNamed:@"defaultAvatar"]];
    }
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.attachmentType ==imageAttachmentType)
    {
        if ([self.images count]==1)
        {//1
            return CGSizeMake([self.images[0].imageWidth floatValue], [self.images[0].imageHeight floatValue]);
        }
        else
        {
            CGFloat lowImageW =(self.frame.size.width -2*XHImageSpace)/3;
            return CGSizeMake(lowImageW, lowImageW);
        }
        
    }
    else if (self.attachmentType ==videoAttachmentType)
    {
        return CGSizeMake([self.video.imageWidth floatValue], [self.video.imageHeight floatValue]);
    }
    
    return CGSizeZero;
}

/**
 根据section返回header大小
 */
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeZero;
}
//设置水平行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return XHImageSpace;
}

- (void)initDelegate
{
    self.delegate =self;
    self.dataSource =self;
}

@end
