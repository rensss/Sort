//
//  ViewController.m
//  排序
//
//  Created by rzk on 2017/10/20.
//  Copyright © 2017年 rzk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *data = [NSArray arrayWithObjects:
                     @"12",@"4",@"3",@"10",@"25",
                     @"17",@"22",@"44",@"1",@"18",
                     @"35",@"11",@"21",@"16",@"34",
                     @"63",@"102",@"65",@"37",@"97", nil];
    
    NSArray *resaultArr;
    // 计算代码运行时间
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    resaultArr = [self bubbleSort:data];
    CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"冒泡排序 Linked in %f ms", linkTime * 1000.0);
//    NSLog(@"%@",resaultArr);
    
    startTime = CFAbsoluteTimeGetCurrent();
    resaultArr = [self selectSort:data];
    linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"选择排序 Linked in %f ms", linkTime * 1000.0);
//    NSLog(@"%@",resaultArr);
    
    startTime = CFAbsoluteTimeGetCurrent();
    resaultArr = [self hillSort:data];
    linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"冒泡排序 Linked in %f ms", linkTime * 1000.0);
//    NSLog(@"%@",resaultArr);
}

/**
 冒泡排序

 @param dataSourceArr 数据源
 @return 有序数据
 */
- (NSArray *)bubbleSort:(NSArray *)dataSourceArr {
        
    NSMutableArray *currentArray = dataSourceArr.mutableCopy;
    NSInteger count = dataSourceArr.count;
    //外循环控制  多少轮
    for (NSInteger i = 0; i < count; i++) {
        //内循环比较  j元素 跟 j+1 比较 相邻的元素
        for (NSInteger j = 0; j < count - 1 - i; j++) {
            if ([currentArray[j] integerValue] > [currentArray[j + 1] integerValue]) {
                NSObject *temp = currentArray[j + 1];
                currentArray[j + 1] = currentArray[j];
                currentArray[j] = temp;
            }
        }
    }
    
    return currentArray.copy;
}

/**
 选择排序

 @param dataSourceArr 数据源
 @return 有序数据
 */
- (NSArray *)selectSort:(NSArray *)dataSourceArr {
    
    NSMutableArray *currentArray = dataSourceArr.mutableCopy;
    NSInteger count = dataSourceArr.count;
    //外层控制轮数 需要比较多少轮
    for (NSInteger i = 0; i < count; i++) {
        //每轮跟其它元素比较 选出最大的 交换
        for (NSInteger j = i + 1; j < count; j++) {
            if ([currentArray[i] integerValue] > [currentArray[j] integerValue]) {
                NSObject *temp = currentArray[j];
                currentArray[j] = currentArray[i];
                currentArray[i] = temp;
            }
        }
    }
    return currentArray.copy;
}

/**
 希尔排序

 @param dataSourceArr 数据源
 @return 有序数组
 */
- (NSArray *)hillSort:(NSArray *)dataSourceArr {
    
    /*
     步长的选择是希尔排序的重要部分。只要最终步长为1任何步长序列都可以工作。算法最开始以一定的步长进行排序。然后会继续以一定步长进行排序，最终算法以步长为1进行排序。当步长为1时，算法变为插入排序，这就保证了数据一定会被排序。
     
     已知的最好步长序列是由Sedgewick提出的(1, 5, 19, 41, 109,...)，该序列的项来自 {\displaystyle 9\times 4^{i}-9\times 2^{i}+1} 9\times 4^{i}-9\times 2^{i}+1和 {\displaystyle 2^{i+2}\times (2^{i+2}-3)+1} 2^{{i+2}}\times (2^{{i+2}}-3)+1这两个算式。这项研究也表明“比较在希尔排序中是最主要的操作，而不是交换。”用这样步长序列的希尔排序比插入排序要快，甚至在小数组中比快速排序和堆排序还快，但是在涉及大量数据时希尔排序还是比快速排序慢。
     另一个在大数组中表现优异的步长序列是（斐波那契数列除去0和1将剩余的数以黄金分区比的两倍的幂进行运算得到的数列）：(1, 9, 34, 182, 836, 4025, 19001, 90358, 428481, 2034035, 9651787, 45806244, 217378076, 1031612713,…)
     */
    
    NSMutableArray *currentArray = dataSourceArr.mutableCopy;
    NSInteger gap = currentArray.count / 2;
    NSInteger i,j;
    
    while (gap >= 1) {
        
        for (i = gap; i < currentArray.count; i ++) {
            NSString *temp = currentArray[i];
            
            for (j = i - gap; j >= 0 && [currentArray[j] integerValue] > [temp integerValue]; j -= gap)
                currentArray[j + gap] = currentArray[j];
            
            currentArray[j + gap] = temp;
        }
        gap = gap / 2;
    }
    
    return currentArray.copy;
}


/**
 快速排序
 
 @param dataSourceArr 数据源
 @return 有序数据
 */
- (NSArray *)quicksort:(NSArray *)dataSourceArr {
	
	CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
	
	NSMutableArray *currentArray = dataSourceArr.mutableCopy;
	
	
	
	CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
	
	NSLog(@"快速排序 Linked in %f ms", linkTime *1000.0);
	
	return currentArray.copy;
}

void sort(int *a, int left, int right)
{
	if(left >= right)/*如果左边索引大于或者等于右边的索引就代表已经整理完成一个组了*/
	{
		return ;
	}
	int i = left;
	int j = right;
	int key = a[left];
	
	while(i < j)/*控制在当组内寻找一遍*/
	{
		/*而寻找结束的条件就是，1，找到一个小于或者大于key的数（大于或小于取决于你想升
		 序还是降序）2，没有符合条件1的，并且i与j的大小没有反转*/
		while(i < j && key <= a[j])
		{
			j--;/*向前寻找*/
		}
		
		a[i] = a[j];
		/*找到一个这样的数后就把它赋给前面的被拿走的i的值（如果第一次循环且key是
		 a[left]，那么就是给key）*/
		
		/*这是i在当组内向前寻找，同上，不过注意与key的大小关系停止循环和上面相反，
		 因为排序思想是把数往两边扔，所以左右两边的数大小与key的关系相反*/
		while(i < j && key >= a[i])
		{
			i++;
		}
		
		a[j] = a[i];
	}
	
	a[i] = key;/*当在当组内找完一遍以后就把中间数key回归*/
	sort(a, left, i - 1);/*最后用同样的方式对分出来的左边的小组进行同上的做法*/
	sort(a, i + 1, right);/*用同样的方式对分出来的右边的小组进行同上的做法*/
	/*当然最后可能会出现很多分左右，直到每一组的i = j 为止*/
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
