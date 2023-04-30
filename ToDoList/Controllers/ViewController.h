//
//  ViewController.h
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 14/10/1401 AP.
//

#import <UIKit/UIKit.h>
#import "Delgate.h"
@interface ViewController : UIViewController
@property id <Delgate> delg;
//@property NSUserDefaults *userDefaults;
@property itemList *item;
-(void)writeArrayWithCustomObjectToUserDefaults:(NSString*) keyName withArray:(NSMutableArray*) myArray;
@end

