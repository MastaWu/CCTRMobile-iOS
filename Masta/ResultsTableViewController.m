//
//  ResultsTableViewController.m
//  Masta
//
//  Created by Stephen Wu on 3/11/15.
//  Copyright (c) 2015 Wu. All rights reserved.
//

#import "ResultsTableViewController.h"
#import "ResultsDetailViewController.h"

@interface ResultsTableViewController()
@property (nonatomic, strong) NSArray *json;
@property (nonatomic, strong) NSDictionary *selected;

@end

@implementation ResultsTableViewController

- (void)viewDidLoad{
    NSURL *url = [NSURL URLWithString:@"https://mobile-api.forteresearch.com/protocols"];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    NSEnumerator *jsonEnum = [jsonDict objectEnumerator];
    self.json = [[NSArray alloc] initWithArray:[jsonEnum allObjects]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.json objectAtIndex:indexPath.row] objectForKey:@"id"]];
    
    return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selected = [self.json objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"detail" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"detail"])
    {
        // Get reference to the destination view controller
        ResultsDetailViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        vc.dict = [[NSMutableDictionary alloc] initWithDictionary:self.selected];
    }
}

@end
