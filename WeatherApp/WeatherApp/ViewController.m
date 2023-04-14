//
//  ViewController.m
//  WeatherApp
//
//  Created by User on 14/04/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)btnSearchClicked:(id)sender {
    
    NSString *name = self.txtCountryname.text;
    NSLog(@"%@", name);
    NSString *apikey = @"c6c6ae5be6307cc6480693da499382b7";
    NSString *url = [NSString stringWithFormat:@"http://api.openweathermap.org/geo/1.0/direct?q=%@&limit=5&appid=%@",name,apikey];
    NSError *error;
    NSURLResponse *response;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Praveen");
        } else {
            NSError *parseError = nil;
            NSArray *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            NSLog(@"%@", responseDictionary);
            self.latvalue = [[responseDictionary objectAtIndex:0]objectForKey:@"lat"];
            self.lonvalue = [[responseDictionary objectAtIndex:0]objectForKey:@"lon"];
            NSLog(@"%@", self.latvalue);
            NSLog(@"%@", self.lonvalue);
            
        }
        NSString *url2 = [NSString stringWithFormat:@"https://api.openweathermap.org/data/2.5/weather?lat=%@&lon=%@&appid=235892d36dbcb779f0ac5bfddc30f326",self.latvalue,self.lonvalue];
        NSError *error2;
        NSURLResponse *response2;
        NSURLSession *session2 = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask2 = [session2 dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url2]]
                                                      completionHandler:^(NSData *data, NSURLResponse *response2, NSError *error2) {
            if (error2) {
                NSLog(@"Praveen");
            } else {
                NSError *parseError = nil;
                NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                NSLog(@"%@", responseDictionary);
                NSDictionary *abs = responseDictionary[@"main"];
                NSString *locname = responseDictionary[@"name"];
                
                
                //NSString *main = [[responseDictionary objectForKey:@"main"];
                NSString *temp = abs[@"temp"];
                float fahrenheit = temp.doubleValue;
                float celsius = (fahrenheit - 32.0)*(5.0/9.0);
                NSLog(@"%f", celsius);
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.lblname.text = locname;
                    self.lbltemp.text = [NSString stringWithFormat:@"%.1f°C", celsius];;
                });
                
            }
        }];
        [dataTask2 resume];
    }];
    [dataTask resume];
    
    
}

@end
