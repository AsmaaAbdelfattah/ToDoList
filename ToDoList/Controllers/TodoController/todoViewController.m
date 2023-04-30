//
//  todoViewController.m
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 14/10/1401 AP.
//

#import "todoViewController.h"
#import "TableViewCell.h"
#import "ViewController.h"
#import "itemList.h"
#import "EditViewController.h"
@interface todoViewController ()


@end

@implementation todoViewController

- (IBAction)PlusBtn:(id)sender {
    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"viewList"];
    VC.delg=self;
    [self presentViewController:VC animated:YES completion:nil];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertController *Secondalert=[UIAlertController alertControllerWithTitle:@"Alert" message:@"Do You Want Delete " preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAct=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(_items.count>0){
            [_items removeObjectAtIndex:indexPath.row];
            [_TodotableView  reloadData];
        }
    }];
    UIAlertAction *cancelAct=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [Secondalert addAction:okAct];
    [Secondalert addAction:cancelAct];
    [self presentViewController:Secondalert animated:YES completion:NULL];
 
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
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
    return _items.count;
}

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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifer=@"todoCell";
    TableViewCell *cell =(TableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifer];
   itemList*item = _items[indexPath.row];

            cell.labelCell.text = item.title;

    if([item.priortyTask isEqual:@"low"])
    {
        [ cell.ImageCell setImage: [UIImage imageNamed:@"low.png"]];
        
    }
    else if([item.priortyTask isEqual:@"medium"])
    {
        [ cell.ImageCell setImage: [UIImage imageNamed:@"mid.png"]];
    }
    else{
        [ cell.ImageCell setImage: [UIImage imageNamed:@"high.png"]];
    }

   return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditViewController *EVC =[self.storyboard instantiateViewControllerWithIdentifier:@"edit"];
    EVC.itemTemp = [_items objectAtIndex:indexPath.row];
    EVC.val=indexPath.row;
    [self presentViewController:EVC animated:YES completion:nil];
    // [self.navigationController pushViewController:EVC animated:YES ];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(void)writeArrayWithCustomObjectToUserDefaults:(NSString*) keyName withArray:(NSMutableArray*) myArray{
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:myArray];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:keyName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSArray*)readArrayWithCustomObjFromUserDefaults:(NSString*)keyName{
    NSData *data =[[NSUserDefaults standardUserDefaults] objectForKey:keyName];
    _items=[NSKeyedUnarchiver unarchiveObjectWithData:data];
    return _items;
}
- (void)viewWillAppear:(BOOL)animated{
  //  _items=[NSMutableArray new];
  //  [self writeArrayWithCustomObjectToUserDefaults:@"todolist" withArray:_items];
    _items=(NSMutableArray*)[self readArrayWithCustomObjFromUserDefaults:@"todolist"];
    [_TodotableView reloadData];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   //_items=[NSMutableArray new];
   
  
    NSData* datasec =[[NSUserDefaults standardUserDefaults] objectForKey:@"todolist"];
 _items=[NSKeyedUnarchiver unarchiveObjectWithData:datasec];
    _TodotableView.delegate = self;
    _TodotableView.dataSource = self;
 //  [_TodotableView reloadData];
    //[self writeArrayWithCustomObjectToUserDefaults:@"todolist" withArray:_items];
}
-(void) additem :(itemList*) item{
    if(_items == nil){
        _items=[NSMutableArray new];
        
    }
    [_items addObject:item];
   // [self categories:item];
    [self writeArrayWithCustomObjectToUserDefaults:@"todolist" withArray:_items];
    [_TodotableView reloadData];

}
-(void) categories:(itemList *) item
{
    for(int i = 0; i< _items.count ;i++)
    {if([[[_items objectAtIndex:i ] priortyTask] isEqual:[item priortyTask]])
    {
        if([[[_items objectAtIndex:i] priortyTask] isEqual:@"low"])
        {
            _low++;
            
        }
        else if([[[_items objectAtIndex:i] priortyTask] isEqual:@"medium"])
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
