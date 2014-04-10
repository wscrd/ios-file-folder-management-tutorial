//
//  NovaReceitaViewController.m
//  Receitas
//
//  Created by Wesley Scardua on 4/10/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "NovaReceitaViewController.h"
#import "Receita.h"

@interface NovaReceitaViewController ()

@end

@implementation NovaReceitaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)adicionarIngrediente:(id)sender {
    if (_campoNome.text.length > 0
        && _ingrediente.text.length >0
        && _unidade.text.length > 0
        && _quantidade.text.length > 0) {
        NSUserDefaults *padrao = [NSUserDefaults standardUserDefaults];
        Receita *r = [[Receita alloc] init];
        [r setPassos:@""];
        NSLog(@"%@", _campoNome.text);
    }
    else {
        NSLog(@"Sem Nome/Ingrediente/Unidade/Quantidade");
    }
}
@end
