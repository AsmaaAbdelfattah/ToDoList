//
//  DoneViewController.m
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 15/10/1401 AP.
//

#import "DoneViewController.h"
#import "itemList.h"
#import"TableViewCell.h"
#import "todoViewController.h"
@interface DoneViewController ()
@property todoViewController *DVC;
@end

@implementation DoneViewController
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
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
    return _doneArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   // static NSString *cellIdentifer=@"progress";
    TableViewCell *cell =(TableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"doneCell"];


    itemList*item = _doneArray[indexPath.row];

             cell.textLabel.text = item.title;

     if([[[_doneArray objectAtIndex:indexPath.row] priortyTask]isEqual:@"low"])
     {
         cell.imageView.image=[UIImage imageNamed:@"low.png"];
         
     }
     else if([[[_doneArray objectAtIndex:indexPath.row] priortyTask] isEqual:@"medium"])
     {
         cell.imageView.image=[UIImage imageNamed:@"mid.png"];
     }
     else{
         cell.imageView.image=[UIImage imageNamed:@"high.png"];
     }

   return cell;
}

-(void) categories:(itemList *) item
{
    for(int i = 0; i< _doneArray.count ;i++)
    {if([[[_doneArray objectAtIndex:i ] priortyTask] isEqual:[item priortyTask]])
    {
        if([[[_doneArray objectAtIndex:i] priortyTask] isEqual:@"low"])
        {
            _low++;
            
        }
        else if([[[_doneArray objectAtIndex:i] priortyTask] isEqual:@"medium"])
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
-(void) additem :(itemList*) item{
    if(_doneArray==nil){
        _doneArray=[NSMutableArray new];
        
    }
    [_doneArray addObject:item];
    [self categories:item];
    [self writeArrayWithCustomObjectToUserDefaults:@"donelist" withArray:_doneArray];
    [_doneTable reloadData];
   
}
-(NSArray*)readArrayWithCustomObjFromUserDefaults:(NSString*)keyName{
    NSData *data =[[NSUserDefaults standardUserDefaults]  objectForKey:keyName];
    _doneArray=[NSKeyedUnarchiver unarchiveObjectWithData:data];
    return _doneArray;
}
-(void)writeArrayWithCustomObjectToUserDefaults:(NSString*) keyName withArray:(NSMutableArray*) myArray{
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:myArray];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:keyName];
    [[NSUserDefaults standardUserDefaults]  synchronize];
}
- (void)viewWillAppear:(BOOL)animated{
  //  [self writeArrayWithCustomObjectToUserDefaults:@"donelist" withArray:_doneArray];
    _doneArray=(NSMutableArray*)[self readArrayWithCustomObjFromUserDefaults:@"donelist"];
    [_doneTable reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // _doneArray=[NSMutableArray new];
    NSData *datasec =[[NSUserDefaults standardUserDefaults] objectForKey:@"donelist"];
    _doneArray=[NSKeyedUnarchiver unarchiveObjectWithData:datasec];
    
    _doneTable.delegate = self;
    _doneTable.dataSource = self;
    //[_doneTable reloadData];
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
