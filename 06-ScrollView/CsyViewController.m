//
//  CsyViewController.m
//  06-ScrollView
//
//  Created by csy on 5/26/14.
//  Copyright (c) 2014 cl. All rights reserved.
//

#import "CsyViewController.h"

@interface CsyViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CsyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //设置contentSize之后才能滚动图片
    self.scrollView.contentSize = self.imageView.bounds.size;
    self.scrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    //设置缩放因子
    self.scrollView.maximumZoomScale = 2.0f;
    self.scrollView.minimumZoomScale = 0.5f;
    
    //缩放功能需要设置代理
    self.scrollView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //返回缩放的对象
    return self.imageView;
//    return nil;
}


@end
