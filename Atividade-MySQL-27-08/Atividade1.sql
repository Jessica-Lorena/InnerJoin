/*Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter o seguinte nome db_generation_game_online, onde, o sistema trabalhará com as informações dos personagens desse game. 
O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.
Siga  exatamente esse passo a passo:
- Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos relevantes da Classe para se trabalhar com o serviço desse game Online.
- Crie uma tabela tb_personagem  e utilizando a habilidade de abstração e determine 5 atributos relevantes dos personagens para se trabalhar com o serviço desse game Online (não esqueça de criar a foreign key de tb_classe nesta tabela).
- Popule esta tabela classe com até 5 dados.
- Popule esta tabela personagem com até 8 dados.
- Faça um select que retorne os personagem com o poder de ataque maior do que 2000.
- Faça um select trazendo  os personagem com poder de defesa entre 1000 e 2000.
- Faça um select  utilizando LIKE buscando os personagens com a letra C.
- Faça um um select com Inner join entre  tabela classe e personagem.
- Faça um select onde traga todos os personagem de uma classe específica (exemplo todos os personagens que são arqueiros).*/

create database db_generation_game_online;

use db_generation_game_online;
create table tb_classe(
	id bigint (5) auto_increment,
    tipo varchar (200) not null,
    armadura varchar (200) not null,
    especial varchar (200) not null,
    primary key (id)
);

create table tb_personagem(
	id bigint (5) auto_increment,
    nome varchar (200) not null,
    lado varchar (200) not null,
    raca varchar (200) not null,
    ataque bigint (5) not null,
    defesa bigint (5) not null,
    classe_id bigint not null,
    primary key (id),
    foreign key (classe_id) references tb_classe (id)
);

insert into tb_classe (tipo, armadura, especial) values ("Druida", "Couro", "Feral");
insert into tb_classe (tipo, armadura, especial) values ("Mago", "Tecido", "Arcano");
insert into tb_classe (tipo, armadura, especial) values ("Cavaleiro da Morte", "Placas", "Profano");
insert into tb_classe (tipo, armadura, especial) values ("Paladino", "Placas", "Retribuição");
insert into tb_classe (tipo, armadura, especial) values ("Xamã", "Malha", "Aperfeiçoamento");

insert into tb_personagem (nome, lado, raca, ataque, defesa, classe_id) values ("Grijahr", "Horda", "Goblin", 2300, 1800, 2);
insert into tb_personagem (nome, lado, raca, ataque, defesa, classe_id) values ("Auguinare", "Aliança", "Draenei", 2000, 2900, 4);
insert into tb_personagem (nome, lado, raca, ataque, defesa, classe_id) values ("Skolmold", "Aliança", "Elfo Noturno", 4000, 2500, 3);
insert into tb_personagem (nome, lado, raca, ataque, defesa, classe_id) values ("Saria", "Horda", "Elfo Sangrento", 1900, 3100, 2);
insert into tb_personagem (nome, lado, raca, ataque, defesa, classe_id) values ("Goldriver", "Aliança", "Worgen", 2700, 2500, 1);
insert into tb_personagem (nome, lado, raca, ataque, defesa, classe_id) values ("Gwo", "Aliança", "Pandaren", 3400, 3700, 5);
insert into tb_personagem (nome, lado, raca, ataque, defesa, classe_id) values ("Kiog", "Horda", "Pandaren", 3400, 3700, 2);
insert into tb_personagem (nome, lado, raca, ataque, defesa, classe_id) values ("Corbonius", "Horda", "Orc", 2700, 2900, 3);

select * from tb_personagem where ataque > 2000;
select * from tb_personagem where defesa between 1000 and 2000;
select * from tb_personagem where nome like "%c%";
select * from tb_personagem inner join tb_classe on tb_classe.id = tb_personagem.classe_id;
select * from tb_personagem inner join tb_classe on tb_classe.id = tb_personagem.classe_id where tb_classe.tipo like "%Mago%";