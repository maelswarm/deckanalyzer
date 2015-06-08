//
//  ViewController.m
//  mtgdeckanalysis
//
//  Created by Brandon Barber on 5/28/15.
//  Copyright (c) 2015 Brandon Barber. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "Card.h"
#import "MyTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, carddelegate> {
    int handCnt;
}

@property Deck *myDeck;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *cellImageViewArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self->handCnt = 0;
    self.cellImageViewArr = [NSMutableArray new];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.tableView];
    
    
    self.myDeck = [[Deck alloc]initWithName:@"CurrentDeck"];
    self.myDeck.delegate = self;
 
    [self.myDeck addCardWithName:@"Duress" andQuantity:4];
    [self.myDeck addCardWithName:@"Bloodghast" andQuantity:4];
    [self.myDeck addCardWithName:@"Creakwood Liege" andQuantity:1];
    [self.myDeck addCardWithName:@"Desecration Demon" andQuantity:4];
    [self.myDeck addCardWithName:@"Geralf's Messenger" andQuantity:4];
    [self.myDeck addCardWithName:@"Kokusho, the Evening Star" andQuantity:1];
    [self.myDeck addCardWithName:@"Sheoldred, Whispering One" andQuantity:1];
    [self.myDeck addCardWithName:@"Sylvan Caryatid" andQuantity:4];
    [self.myDeck addCardWithName:@"Thrun, the Last Troll" andQuantity:1];
    [self.myDeck addCardWithName:@"Manamorphose" andQuantity:3];
    [self.myDeck addCardWithName:@"Hero's Downfall" andQuantity:4];
    [self.myDeck addCardWithName:@"Forest" andQuantity:5];
    [self.myDeck addCardWithName:@"Swamp" andQuantity:9];
    [self.myDeck addCardWithName:@"Temple of Malady" andQuantity:4];
    [self.myDeck addCardWithName:@"Jungle Hollow" andQuantity:2];
    [self.myDeck addCardWithName:@"Thoughtseize" andQuantity:2];
    [self.myDeck addCardWithName:@"Liliana Vess" andQuantity:2];
    [self.myDeck addCardWithName:@"Sarkhan Vol" andQuantity:2];
    [self.myDeck addCardWithName:@"Sorin, Lord of Innistrad" andQuantity:1];
    [self.myDeck addCardWithName:@"Akroma's Memorial" andQuantity:2];
    
//    [self.myDeck addCardWithName:@"Forest" andQuantity:10];
//    [self.myDeck addCardWithName:@"Swamp" andQuantity:10];
//    [self.myDeck addCardWithName:@"Bloodghast" andQuantity:10];
//    [self.myDeck addCardWithName:@"Doom Blade" andQuantity:10];
//    [self.myDeck addCardWithName:@"Thoughtseize" andQuantity:10];
//    [self.myDeck addCardWithName:@"Hero's Downfall" andQuantity:10];
    
    [self.myDeck printDeck];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(calcRandButtHit)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Random Hand" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return self->handCnt;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MyCell";
    
    // Similar to UITableViewCell, but
    MyTableViewCell *cell = (MyTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    } else {
        int i = 0;
        for (UIImageView *tempCellView in cell.imgArray) {
            tempCellView.image = (UIImage *)[[self.cellImageViewArr objectAtIndex:indexPath.row] objectAtIndex:i];
            i++;
        }
    }
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", (long)indexPath.row);
}

- (void)sendBackHand:(Deck *)deck {
    self->handCnt++;
    NSLog(@"HandCNT: %i", self->handCnt);
    NSIndexPath *customPath = [NSIndexPath indexPathForRow:self->handCnt-1 inSection:0];
    NSLog(@"HandCNT: %i %@", self->handCnt, customPath);
    [self.tableView insertRowsAtIndexPaths:@[customPath]withRowAnimation:UITableViewRowAnimationBottom];
    NSMutableArray *imgArr = [NSMutableArray new];
    //NSLog(@" ");
    for (int i=0; i<7; i++) {
        NSLog(@"%@", ((Card *)[deck.content objectAtIndex:i]).name);
        [imgArr insertObject:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", ((Card *)[deck.content objectAtIndex:i]).name]] atIndex:i];
    }
    [self.cellImageViewArr addObject:imgArr];
}

- (void)calcRandButtHit {
    [self.myDeck calcRandHandProb];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
