//
//  ViewController.m
//  mtgdeckanalysis
//
//  Created by Brandon Barber on 5/28/15.
//  Copyright (c) 2015 Brandon Barber. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"

@interface ViewController ()

@property Deck *myDeck;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myDeck = [[Deck alloc]initWithName:@"CurrentDeck"];
    //[self.myDeck addCardWithName:@"Bile Blight" andQuantity:1];
    [self.myDeck addCardWithName:@"Bloodsoaked Champion" andQuantity:4];
    [self.myDeck addCardWithName:@"Bloodghast" andQuantity:4];
    [self.myDeck addCardWithName:@"Creakwood Liege" andQuantity:2];
    [self.myDeck addCardWithName:@"Desecration Demon" andQuantity:2];
    [self.myDeck addCardWithName:@"Geralf's Messenger" andQuantity:4];
    [self.myDeck addCardWithName:@"Kokusho, the Evening Star" andQuantity:1];
    [self.myDeck addCardWithName:@"Scavenging Ooze" andQuantity:3];
    [self.myDeck addCardWithName:@"Scute Mob" andQuantity:1];
    [self.myDeck addCardWithName:@"Sheoldred, Whispering One" andQuantity:1];
    [self.myDeck addCardWithName:@"Sylvan Caryatid" andQuantity:2];
    [self.myDeck addCardWithName:@"Thrun, the Last Troll" andQuantity:1];
    [self.myDeck addCardWithName:@"Doom Blade" andQuantity:3];
    [self.myDeck addCardWithName:@"Hero's Downfall" andQuantity:4];
    [self.myDeck addCardWithName:@"Forest" andQuantity:7];
    [self.myDeck addCardWithName:@"Swamp" andQuantity:14];
    [self.myDeck addCardWithName:@"Temple of Malady" andQuantity:4];
    [self.myDeck addCardWithName:@"Infernal Tutor" andQuantity:1];
    [self.myDeck addCardWithName:@"Thoughtseize" andQuantity:2];
    
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

- (void)calcRandButtHit {
    [self.myDeck calcRandHandProb];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
