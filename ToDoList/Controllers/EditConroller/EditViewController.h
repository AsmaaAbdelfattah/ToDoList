//
//  EditViewController.h
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 14/10/1401 AP.
//

#import <UIKit/UIKit.h>
#import "Delgate.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditViewController : UIViewController<Delgate>
@property NSNumber *index;
@property itemList *itemTemp;
@property NSInteger *val;
-(void) additem :(itemList*) item;
@end

NS_ASSUME_NONNULL_END
