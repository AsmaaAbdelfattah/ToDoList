//
//  ProgressViewController.m
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 15/10/1401 AP.
//

#import "ProgressViewController.h"
#import "itemList.h"
#import "TableViewCell.h"
#import "todoViewController.h"
@interface ProgressViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *progressImage;
@property todoViewController *DVC;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@end

@implementation ProgressViewController
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    if(section == 0)
//        return @"Low";
//
//    else if(section == 1)
//
//        return @"Medium";
//
//    else
//
//        return @"High";
//
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    if(section == 0)
    //        return _low;
    //
    //    else if(section == 1)
    //    {
    //        printf("%d",_mid);
    //        return _mid;
    //    }
    //    else
    //    {
    //        return _high;
    //    }
    return _progressArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   // static NSString *cellIdentifer=@"progress";
    UITableViewCell *cell =(TableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"progressCell"];

    itemList*item = _progressArray[indexPath.row];

             cell.textLabel.text = item.title;

     if([[[_progressArray objectAtIndex:indexPath.row] priortyTask]isEqual:@"low"])
     {
         cell.imageView.image=[UIImage imageNamed:@"low.png"];
         
     }
     else if([[[_progressArray objectAtIndex:indexPath.row] priortyTask] isEqual:@"medium"])
     {
         cell.imageView.image=[UIImage imageNamed:@"mid.png"];
     }
     else{
         cell.imageView.image=[UIImage imageNamed:@"high.png"];
     }


   return cell;
    
}


-(void) additem :(itemList*) item{
    if(_progressArray == nil){
        _progressArray=[NSMutableArray new];
    }
    [_progressArray addObject:item];
    [self categories:item];
    [self writeArrayWithCustomObjectToUserDefaults:@"progresslist" withArray:_progressArray];
    [_progressTable reloadData];
   
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertController *Secondalert=[UIAlertController alertControllerWithTitle:@"Alert" message:@"Do You Want Delete " preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAct=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(_progressArray.count>0){
            [_progressArray removeObjectAtIndex:indexPath.row];
            [_progressTable  reloadData];
        }
    }];
    UIAlertAction *cancelAct=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [Secondalert addAction:okAct];
    [Secondalert addAction:cancelAct];
    [self presentViewController:Secondalert animated:YES completion:NULL];
 
}
-(NSArray*)readArrayWithCustomObjFromUserDefaults:(NSString*)keyName{
    NSData *data =[[NSUserDefaults standardUserDefaults]  objectForKey:keyName];
    _progressArray=[NSKeyedUnarchiver unarchiveObjectWithData:data];
    return _progressArray;
}
-(void)writeArrayWithCustomObjectToUserDefaults:(NSString*) keyName withArray:(NSMutableArray*) myArray{
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:myArray];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:keyName];
    [[NSUserDefaults standardUserDefaults]  synchronize];
}
- (void)viewWillAppear:(BOOL)animated{
    //[self writeArrayWithCustomObjectToUserDefaults:@"progresslist" withArray:_progressArray];
   _progressArray=(NSMutableArray*) [self readArrayWithCustomObjFromUserDefaults:@"progresslist"];
 //   [self categories:item];
   [_progressTable reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 //   _progressArray=[NSMutableArray new];
  NSData*  datasec =[[NSUserDefaults standardUserDefaults] objectForKey:@"progresslist"];
   _progressArray=[NSKeyedUnarchiver unarchiveObjectWithData:datasec];
    _progressTable.delegate = self;
    _progressTable.dataSource = self;
   // [_progressTable reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) categories:(itemList *) item
{
    for(int i = 0; i< _progressArray.count ;i++)
    {if([[[_progressArray objectAtIndex:i ] priortyTask] isEqual:[item priortyTask]])
    {
        if([[[_progressArray objectAtIndex:i] priortyTask] isEqual:@"low"])
        {
            _low++;
            
        }
        else if([[[_progressArray objectAtIndex:i] priortyTask] isEqual:@"medium"])
        {
            _mid++;
            printf("%d",_mid);
        }
        else{
            _high++;
        }
    }
    }
}

@end
