//
//  ListaTableViewController.m
//  Lista
//
//  Created by Bryan A Bolivar M on 5/9/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

#import "ListaTableViewController.h"
#import "CeldaTableViewCell.h"
#import "Jugador.h"
#import "DetallesJugadorViewController.h"

@interface ListaTableViewController (){
    NSArray *listaDeJugadores;
    Jugador * jugadorSeleccionado;
}

@end

@implementation ListaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    listaDeJugadores = @[@{
                           @"nombre":@"falcao",
                           @"posicion": @"delantero",
                           @"goles": @"1000",
                           @"fotoUrl": @"http://i.ytimg.com/vi/MDh_51yJY4g/maxresdefault.jpg"
                           },
                         @{
                             @"nombre":@"Teo",
                             @"posicion": @"delantero",
                             @"goles": @"2000",
                             @"fotoUrl": @"http://www.terra.com/addon/img/deportes/e5fb0a-teofilo-gutierrez-619p.jpg"
                             },
                         
                         ];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //numero de secciones en la tabla
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //numero de celdas por seccion
    return listaDeJugadores.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //configuracion de contenido en la celda
    CeldaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celdaIdentifier" forIndexPath:indexPath];
    
    Jugador * jugador = [self convertirDesdeDiccionario:[listaDeJugadores objectAtIndex:indexPath.row]];
    
    NSLog(@"%@",jugador.nombre);
    
    cell.nombre.text = jugador.nombre;
    cell.posicion.text = jugador.posicion;
    cell.goles.text = [NSString stringWithFormat:@"%@", jugador.goles];
    [cell cargarFotoDesdeURL:jugador.fotoUrl];
    cell.foto.layer.cornerRadius = 44.0f;
    cell.foto.clipsToBounds = true;
    return cell;
}

-(Jugador *)convertirDesdeDiccionario:(NSDictionary *) dictionary{
    Jugador * jugador = [[Jugador alloc] init];
    jugador.nombre = [dictionary objectForKey:@"nombre"];
    jugador.goles = [NSNumber numberWithInt:[[dictionary objectForKey:@"goles"] integerValue]];
    jugador.posicion = [dictionary objectForKey:@"posicion"];
    jugador.fotoUrl = [NSURL URLWithString:[dictionary objectForKey:@"fotoUrl"]];
    return jugador;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    jugadorSeleccionado = [[Jugador alloc] init];
    jugadorSeleccionado = [self convertirDesdeDiccionario:[listaDeJugadores objectAtIndex:indexPath.row]];
    [self performSegueWithIdentifier:@"detallesJugadorSegue" sender:self];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString: @"detallesJugadorSegue"]){
        [segue.destinationViewController setPlayer:jugadorSeleccionado];
    }
}


@end
