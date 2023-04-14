//
//  ViewController.h
//  WeatherApp
//
//  Created by User on 14/04/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
    
   // NSString *lonvalue;
}
@property (weak, nonatomic) IBOutlet UITextField *txtCountryname;
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;
@property (nonatomic, assign)NSString *latvalue;
@property (nonatomic, assign)NSString *lonvalue;
@property (weak, nonatomic)IBOutlet UILabel *lblname;
@property (weak, nonatomic)IBOutlet UILabel *lbltemp;
@end

