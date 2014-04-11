//
//  NovaReceitaViewController.m
//  Receitas
//
//  Created by Wesley Scardua on 4/10/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "NovaReceitaViewController.h"
#import "Receita.h"
#import "Ingrediente.h"

@interface NovaReceitaViewController () {
    NSMutableArray *igd;
    NSMutableArray *qte;
    NSMutableArray *u;
    //Usar NSDictionary para guardar estes vetores
}

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    igd = [[NSMutableArray alloc] init];
    qte = [[NSMutableArray alloc] init];
    u   = [[NSMutableArray alloc] init];

    _campoNome.delegate =self;
    _quantidade.delegate = self;
    _unidade.delegate = self;
    _ingrediente.delegate = self;
    
    // Do any additional setup after loading the view.
    [_botaoSalvar setHidden:YES];
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
        
        [igd addObject:_ingrediente.text];
        [u addObject:_unidade.text];
        [qte addObject:[NSNumber numberWithInt:[_quantidade.text integerValue] ]];
        [_botaoSalvar setHidden:NO];
        
    }
    else {
        NSLog(@"Sem Nome/Ingrediente/Unidade/Quantidade");
    }
}

- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)salvar:(id)sender {
    NSLog(@"botao Salvar");
    NSUserDefaults *padrao = [NSUserDefaults standardUserDefaults];
    [padrao setObject:_campoNome.text forKey:@"nome"];
    [padrao setObject:(NSArray *)igd forKey:@"i"];
    [padrao synchronize];
    [padrao setObject:u forKey:@"unidade"];
    [padrao setObject:qte forKey:@"quantidade"];
    [_botaoSalvar setHidden:YES];
    _campoNome.text = @"";
    _unidade.text = @"";
    _quantidade.text = @"";
}
@end
