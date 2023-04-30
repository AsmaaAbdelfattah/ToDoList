//
//  DoneViewController.h
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 15/10/1401 AP.
//

#import <UIKit/UIKit.h>
#import "itemList.h"
#import "Delgate.h"
NS_ASSUME_NONNULL_BEGIN

@interface DoneViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *doneTable;
@property id <Delgate> doneDelg;
@property NSMutableArray *doneArray;
@property int low;
@property int mid;
@property int high;
-(void) additem :(itemList*) item;
-(void) categories:(itemList *) item;
-(NSArray*)readArrayWithCustomObjFromUserDefaults:(NSString*)keyName;
-(void)writeArrayWithCustomObjectToUserDefaults:(NSString*) keyName withArray:(NSMutableArray*) myArray;
@end

NS_ASSUME_NONNULL_END
