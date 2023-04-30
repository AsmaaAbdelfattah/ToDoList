//
//  EditViewController.m
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 14/10/1401 AP.
//

#import "EditViewController.h"
#import "todoViewController.h"
#import "ViewController.h"
#import "ProgressViewController.h"
#import "DoneViewController.h"
@interface EditViewController ()
{
    itemList *temp ;
}

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *desFie;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioSchems;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *stateSchema;
@property NSMutableArray *donearray;
@property NSMutableArray *progressarray ;
@property NSMutableArray *todarray;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(_progressarray==nil){
        _progressarray=[NSMutableArray new];
     
    }
    if(_donearray==nil){
        _donearray=[NSMutableArray new];
    }
    _titleField.text= [_itemTemp title];
    _desFie.text=[_itemTemp  descr];
    _datePicker.date=[_itemTemp date];
    
    [self.prioSchems setSelectedSegmentIndex:[_itemTemp priortyTask]];
    [self->_stateSchema titleForSegmentAtIndex:self->_stateSchema.selectedSegmentIndex];
    NSData *datasec =[[NSUserDefaults standardUserDefaults] objectForKey:@"donelist"];
    _donearray=[NSKeyedUnarchiver unarchiveObjectWithData:datasec];
     datasec =[[NSUserDefaults standardUserDefaults] objectForKey:@"progresslist"];
    _progressarray=[NSKeyedUnarchiver unarchiveObjectWithData:datasec];

    datasec =[[NSUserDefaults standardUserDefaults] objectForKey:@"todolist"];
 _todarray=[NSKeyedUnarchiver unarchiveObjectWithData:datasec];
}
//-(void)writeArrayWithCustomObjectToUserDefaults:(NSString*) keyName withArray:(NSMutableArray*) myArray{
//    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:myArray];
//    [[NSUserDefaults standardUserDefaults] setObject:data forKey:keyName];
//    [[NSUserDefaults standardUserDefaults]  synchronize];
//}
- (IBAction)editBtn:(id)sender {

    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Alert" message:@"Do You Want To Save Edit" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *act=[UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

       [self additem:self->_itemTemp];
        //[self.navigationController popViewControllerAnimated:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:act];
    UIAlertAction *cancelAct=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
       // [self.navigationController popViewControllerAnimated:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:cancelAct];
    [self presentViewController:alert animated:YES completion:NULL];
}

-(void) additem :(itemList*) item{
    if( self.stateSchema.selectedSegmentIndex == 1 ){
        if(_progressarray ==nil){
            _progressarray=[NSMutableArray new];
        }
        ProgressViewController *PVC =[self.storyboard instantiateViewControllerWithIdentifier:@"progress"];
         [_progressarray addObject:item];
      [_todarray removeObjectAtIndex:_val ];
        NSData *data=[NSKeyedArchiver archivedDataWithRootObject:_progressarray];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"progresslist"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        data=[NSKeyedArchiver archivedDataWithRootObject:_todarray];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"todolist"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else if ( self.stateSchema.selectedSegmentIndex == 2)
    {
        if(_donearray ==nil){
            _donearray=[NSMutableArray new];
        }
      DoneViewController  *DVC =[self.storyboard instantiateViewControllerWithIdentifier:@"done"];
        [_donearray addObject:item];
        [_todarray removeObjectAtIndex:_val];
        NSData *data=[NSKeyedArchiver archivedDataWithRootObject:_donearray];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"donelist"];
        [[NSUserDefaults standardUserDefaults] synchronize];
     
        data=[NSKeyedArchiver archivedDataWithRootObject:_todarray];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"todolist"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else{
     todoViewController *TVC =[self.storyboard instantiateViewControllerWithIdentifier:@"todo"];
     
      [ _todarray removeObjectAtIndex:_val];
        [ _todarray addObject:item];
        NSData *data=[NSKeyedArchiver archivedDataWithRootObject:_todarray];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"todolist"];
        [[NSUserDefaults standardUserDefaults] synchronize];

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
