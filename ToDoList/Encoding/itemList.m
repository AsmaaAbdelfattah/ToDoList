//
//  itemList.m
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 14/10/1401 AP.
//

#import "itemList.h"

@implementation itemList


- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_title forKey:@"title"];
    [coder encodeObject:_descr forKey:@"Desc"];
    [coder encodeObject:_date forKey:@"Date"];
  [coder encodeObject:_priortyTask forKey:@"Priorty"];
    [coder encodeObject:_state forKey:@"State"];

}
- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self=[super init];
    if(self!=nil){
        self.title = [coder decodeObjectForKey:@"title"];
        self.descr = [coder decodeObjectForKey:@"Desc"];
        self.date = [coder decodeObjectForKey:@"Date"];
        self.priortyTask = [coder decodeObjectForKey:@"Priorty"];
        self.state = [coder decodeObjectForKey:@"State"];
       
    }
    return self;
}

@end
