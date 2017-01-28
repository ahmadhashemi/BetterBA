@interface WRFormTextField : UITextField
@end

@interface WRFieldSetView

@property(retain, nonatomic) WRFormTextField *textField;

@end

@interface WRFormView : UIView

@property(retain, nonatomic) UITableView *tableView;

@end

@interface CardFullInfoEntryViewController : UIViewController

@property(retain, nonatomic) WRFormView *formView;
@property(retain, nonatomic) NSArray *fields;

@end

@interface CardInfoEntryViewController : UIViewController

@property(retain, nonatomic) WRFormView *formView;
@property(retain, nonatomic) NSArray *fields;

@end