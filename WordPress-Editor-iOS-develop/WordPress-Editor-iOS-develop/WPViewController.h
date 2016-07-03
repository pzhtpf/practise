#import <UIKit/UIKit.h>
@import WordPress_Editor_iOS_Extension;
#import "publishedArticleViewModel.h"

@interface WPViewController : WPEditorViewController <WPEditorViewControllerDelegate,UIActionSheetDelegate>
@property(nonatomic,retain)publishedArticleViewModel *viewModel;
@end
