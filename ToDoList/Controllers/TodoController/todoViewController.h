//
//  todoViewController.h
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 14/10/1401 AP.
//

#import <UIKit/UIKit.h>
#import "Delgate.h"
NS_ASSUME_NONNULL_BEGIN

@interface todoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,Delgate>
@property (weak, nonatomic) IBOutlet UITableView *TodotableView;
@property int low;
@property int mid;
@property int high;
//@property NSUserDefaults *userDefaults;
@property NSMutableArray *items;
-(void) additem :(itemList*) item;
-(void) categories:(itemList *) item;
-(void)writeArrayWithCustomObjectToUserDefaults:(NSString*) keyName withArray:(NSMutableArray*) myArray;
-(NSArray*)readArrayWithCustomObjFromUserDefaults:(NSString*)keyName;
@end

NS_ASSUME_NONNULL_END
