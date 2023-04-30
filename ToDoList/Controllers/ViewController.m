//
//  ViewController.m
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 14/10/1401 AP.
//

#import "ViewController.h"
#import "itemList.h"
#import "Delgate.h"
#import "todoViewController.h"
@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *descField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioSeg;
@property (weak, nonatomic) IBOutlet UIDatePicker *Date;
@property  todoViewController *DVC;
@end

@implementation ViewController
//-(void)writeArrayWithCustomObjectToUserDefaults:(NSString*) keyName withArray:(NSMutableArray*) myArray{
//    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:myArray];
//    [[NSUserDefaults standardUserDefaults] setObject:data forKey:keyName];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}
- (IBAction)AddBtn:(id)sender {
    _item=[itemList new];

    if(![_titleLabel.text isEqual:@""] && ![_descField.text isEqual:@""]){
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Alert" message:@"Do You Want To Save" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *act=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self->_item.title= self->_titleLabel.text;
            self->_item.descr =self-> _descField.text;
            self->_item.date = self->_Date.date;
            
            _item.priortyTask = [self->_prioSeg titleForSegmentAtIndex:self->_prioSeg.selectedSegmentIndex];
           
           // _item.priortyTask =_prioSeg.selectedSegmentIndex;
            self->_item.state=0;

          [self->_delg additem:self->_item];
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:act];
        UIAlertAction *cancelAct=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:cancelAct];
        [self presentViewController:alert animated:YES completion:NULL];
    }else{
        UIAlertController *Secondalert=[UIAlertController alertControllerWithTitle:@"Alert" message:@"Enter Your Task" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAct=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *cancelAct=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [Secondalert addAction:okAct];
        [Secondalert addAction:cancelAct];
        [self presentViewController:Secondalert animated:YES completion:NULL];

    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //_priortySegment =@0;
    

}


@end
