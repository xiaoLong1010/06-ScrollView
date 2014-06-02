//
//  CsyViewController.m
//  AutoScroll
//
//  Created by csy on 5/26/14.
//  Copyright (c) 2014 cl. All rights reserved.
//

#import "CsyViewController.h"



enum {
    kPictureCount = 5,
    kPageCenterX = 160,
    kPageCenterY = 140
};

@interface CsyViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) UIPageControl *page;
@property (strong,nonatomic) NSTimer *timer;

@end

@implementation CsyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addImageViews];  //添加图片
    self.scrollView.pagingEnabled = YES;    //允许分页
    
    self.scrollView.delegate = self;  //设置代理
	
    
    
}

- (void)addScrollTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(nextPicure) userInfo:nil repeats:YES];

    
}

- (void)addImageViews
{
    CGFloat width = self.scrollView.bounds.size.width;
    CGFloat heigth = self.scrollView.bounds.size.height;
    for (int i = 0;i < kPictureCount; i++) {
        CGFloat x = width * i;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, width, heigth)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img_%02d",i+1]];
        
        [self.scrollView addSubview:imageView];
        
    }
    
    self.scrollView.contentSize = CGSizeMake(kPictureCount * width, 0);
    self.page.currentPage = 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = self.scrollView.contentOffset.x;
    
    CGFloat width = self.scrollView.bounds.size.width;
    
    self.page.currentPage = (offsetX +  0.5 * width)/ width;
}

- (UIPageControl *)page
{
    if (!_page) {
        _page = [[UIPageControl alloc] init];
        _page.numberOfPages = kPictureCount;
        _page.tintColor = [UIColor blackColor];
        _page.pageIndicatorTintColor = [UIColor blackColor];
        _page.currentPageIndicatorTintColor = [UIColor redColor];
        self.page.center = CGPointMake(kPageCenterX, kPageCenterY);
        [self.view addSubview:_page];
    }
    
    return _page;
}

@end
