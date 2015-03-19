//
//  ViewController.m
//  LOL-Hero-Show-OC
//
//  Created by Linus on 15-3-19.
//  Copyright (c) 2015年 Linus. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *heros;

@end

@implementation ViewController

- (NSArray *)heros
{
    if (!_heros) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        for(NSDictionary *dict in array){
            Hero *h = [Hero heroWithDict:dict];
            [arrayM addObject:h];
        }
        
        
        _heros = [arrayM copy];
        
    }
    return _heros;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

//- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    return 1;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    Hero *hero = self.heros[indexPath.row];
    
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.detailTextLabel.textColor = [UIColor blueColor];
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
