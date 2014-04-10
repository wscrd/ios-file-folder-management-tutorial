//
//  NovaReceitaViewController.h
//  Receitas
//
//  Created by Wesley Scardua on 4/10/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NovaReceitaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *campoNome;
@property (weak, nonatomic) IBOutlet UITextField *ingrediente;
@property (weak, nonatomic) IBOutlet UITextField *unidade;
@property (weak, nonatomic) IBOutlet UITextField *quantidade;
- (IBAction)adicionarIngrediente:(id)sender;

@end
