//
//  ViewController.m
//  DynamicCellsFonts
//
//  Created by kluv on 26/02/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [[UIFont familyNames] count];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray* familyNames = [UIFont familyNames];
    NSArray* fontNames = [UIFont fontNamesForFamilyName:[familyNames objectAtIndex:section]];
    
    return [fontNames count];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray* familyNames = [UIFont familyNames];
   
    NSString* familyName = [familyNames objectAtIndex:section];
    
    return familyName;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        NSLog(@"Created cell!");
    }
    
    NSArray* familyNames = [UIFont familyNames];
    NSArray* fontNames = [UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indexPath.section]];
    
    NSString* fontName = [fontNames objectAtIndex:indexPath.row];
    
    UIFont* font = [UIFont fontWithName:fontName size:16];
    
    cell.textLabel.font = font;
    cell.textLabel.text = fontName;
    
    return cell;
    
}

@end
