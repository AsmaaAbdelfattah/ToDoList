//
//  TableViewCell.h
//  ToDoList
//
//  Created by Asmaa_Abdelfattah on 14/10/1401 AP.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImageCell;
@property (weak, nonatomic) IBOutlet UILabel *labelCell;

@end

NS_ASSUME_NONNULL_END
