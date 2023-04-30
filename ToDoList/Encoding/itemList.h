//
//  itemList.h
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 14/10/1401 AP.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface itemList : NSObject<NSCoding>
@property NSString *title;
@property NSString *descr;
@property NSDate *date;
@property NSNumber *priortyTask;
@property NSNumber *state;

- (void)encodeWithCoder:(NSCoder *)coder ;

- (nullable instancetype)initWithCoder:(NSCoder *)coder ;

@end

NS_ASSUME_NONNULL_END
