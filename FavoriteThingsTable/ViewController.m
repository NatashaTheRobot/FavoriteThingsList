//
//  ViewController.m
//  FavoriteThingsTable
//
//  Created by Natasha Murashev on 5/7/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *favoriteThings;

- (IBAction)AddFavoriteThingWithButton:(id)sender;
- (IBAction)RemoveFavoriteThingWithButton:(id)sender;
- (IBAction)ReverseOrderWithButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.favoriteThings = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Actions

- (IBAction)AddFavoriteThingWithButton:(id)sender
{
    if (![self.textField.text isEqualToString:@""]) {
        [self.favoriteThings addObject:self.textField.text];
        self.textField.text = nil;
        
        
        
        NSIndexPath *path = [NSIndexPath indexPathForRow:(self.favoriteThings.count - 1) inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}

- (IBAction)RemoveFavoriteThingWithButton:(id)sender
{
    [self.favoriteThings removeLastObject];
//    [self.tableView reloadData];
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:(self.favoriteThings.count - 1) inSection:0];
    [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
}

- (IBAction)ReverseOrderWithButton:(id)sender
{
    self.favoriteThings = [NSMutableArray arrayWithArray:[[self.favoriteThings reverseObjectEnumerator] allObjects]];
    [self.tableView reloadData];
    
}

#pragma mark - Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.favoriteThings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"default";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [self.favoriteThings objectAtIndex:indexPath.row];
    
    return cell;
}

@end
