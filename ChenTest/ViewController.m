//
//  ViewController.m
//  ChenTest
//
//  Created by CHENGANG on 16/4/27.
//  Copyright © 2016年 CHENGANG. All rights reserved.
//

#import "ViewController.h"
#import "CGExendeds.h"
#import <AVFoundation/AVFoundation.h>
#import "QianDaoCollectionViewCell.h"

@interface ViewController ()<AVCaptureMetadataOutputObjectsDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;


@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (nonatomic, assign) NSInteger *monCount;
@end

@implementation ViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //生成随机数
//    [self setsuiji];
    //二维码
//    [self setupCamera];
//    //图片轮播
//    [self setlunImage];
    //签到代码
    [self setQiandao];
    
   
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)setsuiji{
    int x = arc4random() % 2;
    NSString *string=@"";
    switch (x) {
        case 0:
            string = @"白色";
            break;
        case 1:
            string = @"黑色";
            break;
        default:
            break;
    }
    NSLog(@"%@",[NSString stringWithFormat:@"什么颜色：%@",string]);
}

- (void)setupCamera
{
    // Device
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    
    // Output
    self.output = [[AVCaptureMetadataOutput alloc]init];
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // Session
    self.session = [[AVCaptureSession alloc]init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([self.session canAddInput:self.input])
    {
        [self.session addInput:self.input];
    }
    if ([self.session canAddOutput:self.output])
    {
        [self.session addOutput:self.output];
    }
    //    _output.rectOfInterest = CGRectMake((SCREEN_WIDTH/2-110)/SCREEN_HEIGHT, 65/SCREEN_WIDTH, 220/SCREEN_HEIGHT, 220/SCREEN_WIDTH);
    
    // 条码类型 AVMetadataObjectTypeQRCode
    self.output.metadataObjectTypes =@[AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeCode128Code,AVMetadataObjectTypeQRCode];
    // Preview
    self.preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.preview.frame=[UIScreen mainScreen].bounds;
    [self.view.layer insertSublayer:self.preview atIndex:0];
    // Start
    [self.session startRunning];
}

#pragma mark ---AVCaptureMetadataOutputObjectsDelegate----
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    [self.session stopRunning];
    self.session=nil;
    [self.preview removeFromSuperlayer];
    NSLog(@"======%@",stringValue);
    
}
- (void)setlunImage{
    
}




- (void)setQiandao{
    [self.collection registerClass:[QianDaoCollectionViewCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents *components = [calendar components:unitFlags fromDate:[NSDate date]];
    
    NSInteger iCurYear = [components year];  //当前的年份
    
    NSInteger iCurMonth = [components month];  //当前的月份
    
    NSInteger iCurDay = [components day];  // 当前的号数
   
    NSString  *dateStr = nil;
    NSMutableArray *arr = [NSMutableArray array];
    
    for (NSInteger i = 1; i <= iCurDay; i++) {
        dateStr  = [NSString stringWithFormat:@"%d-%d-%d", iCurYear, iCurMonth, i];
        [arr addObject:dateStr];
    }
    
    
    
    NSDateComponents *startComps = [[NSDateComponents alloc]init];
    startComps.day = 1;
    startComps.month = iCurMonth;
    startComps.year = iCurYear;
    
    
    NSDateComponents *endComps = [[NSDateComponents alloc]init];
    endComps.day = 1;
    endComps.month = iCurMonth == 12 ? 1 : iCurMonth + 1;
    endComps.year = iCurMonth == 12 ? iCurYear + 1 : iCurYear;
    
    NSDate *startDate = [calendar dateFromComponents:startComps];
    NSDate *endDate = [calendar dateFromComponents:endComps];
    
    NSDateComponents *diff = [calendar components:NSCalendarUnitDay fromDate:startDate toDate:endDate options:NSCalendarMatchFirst];
    
    NSInteger nowDay=diff.day;
    NSLog(@"当月天数%ld",(long)nowDay);
    self.monCount = nowDay;
    
    NSString *jihggjgg= [self weekdayStringFromDate:nil];
//    //获取当月天数  方式二
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[NSDate date]];
//    NSUInteger numberOfDaysInMonth = range.length;
    
//    _arrayList = [arr copy];
}

- (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSString* timeStr = @"2016-06-01 17:40:50";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate* date = [formatter dateFromString:timeStr];
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.monCount+3;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float www= self.view.frame.size.width/7;
    return CGSizeMake(www-5, 20);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CollectionCell";
     QianDaoCollectionViewCell *cell = (QianDaoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if (indexPath.row>2) {
        [cell.titletext setText:[NSString stringWithFormat:@"%ld",(long)indexPath.row+1-3]];
    }else{
        [cell.titletext setText:@""];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
