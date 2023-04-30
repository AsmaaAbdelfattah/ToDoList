//
//  ProgressViewController.h
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 15/10/1401 AP.
//

#import <UIKit/UIKit.h>
#import "itemList.h"
#import "Delgate.h"
NS_ASSUME_NONNULL_BEGIN

@interface ProgressViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property id <Delgate> progressDelg;
@property (weak, nonatomic) IBOutlet UITableView *progressTable;
@property NSMutableArray *progressArray;
@property int low;
@property int mid;
@property int high;
-(void) additem :(itemList*) item;
-(NSArray*)readArrayWithCustomObjFromUserDefaults:(NSString*)keyName;
-(void)writeArrayWithCustomObjectToUserDefaults:(NSString*) keyName withArray:(NSMutableArray*) myArray;
-(void) categories:(itemList *) item;


@end

NS_ASSUME_NONNULL_END
