//
//  Delgate.h
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 14/10/1401 AP.
//

#import <Foundation/Foundation.h>
#import "itemList.h"
NS_ASSUME_NONNULL_BEGIN

@protocol Delgate <NSObject>
-(void) additem :(itemList*) item;
@end

NS_ASSUME_NONNULL_END
