/*Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco deverá ter o seguinte nome db_pizzaria_legal, onde o sistema trabalhará com as informações dos produtos desta empresa. 
O sistema trabalhará com 2 tabelas tb_pizza e tb_categoria.
Siga  exatamente esse passo a passo:
- Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.
- Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_pizza para se trabalhar com o serviço dessa pizzaria(não esqueça de criar a foreign key de tb_categoria nesta tabela).
- Popule esta tabela Categoria com até 5 dados.
- Popule esta tabela pizza com até 8 dados.
- Faça um select que retorne os Produtos com o valor maior do que 45 reais.
- Faça um select trazendo  os Produtos com valor entre 29 e 60 reais.
- Faça um select  utilizando LIKE buscando os Produtos com a letra C.
- Faça um um select com Inner join entre  tabela categoria e pizza.
- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são pizza doce).*/

create database db_pizzaria_legal;

use db_pizzaria_legal;
create table tb_categoria(
	id bigint (5) auto_increment,
    vegana boolean not null,
    borda boolean not null,
    doce boolean not null,
    primary key (id)
);

create table tb_pizza(
	id bigint (5) auto_increment,
    nome varchar (200) not null,
    valor decimal (5,2) not null,
    entrega boolean not null,
    endereco_entrega varchar (200) not null,
    valor_entrega decimal (5,2) not null,
    categoria_id bigint not null,
    primary key (id),
    foreign key (categoria_id) references tb_categoria (id)
);

insert into tb_categoria (vegana, borda, doce) values (true,true,true);
insert into tb_categoria (vegana, borda, doce) values (true,true,false);
insert into tb_categoria (vegana, borda, doce) values (true,false,false);
insert into tb_categoria (vegana, borda, doce) values (true,false,true);
insert into tb_categoria (vegana, borda, doce) values (false,true,false);

insert into tb_pizza (nome, valor, entrega, endereco_entrega, valor_entrega, categoria_id) values ("Estupenda", 42.99, true, "Rua das Abobrinhas, 934", 18.53, 2);
insert into tb_pizza (nome, valor, entrega, endereco_entrega, valor_entrega, categoria_id) values ("ChocoCream", 51.89, false, "--", 0, 1);
insert into tb_pizza (nome, valor, entrega, endereco_entrega, valor_entrega, categoria_id) values ("Suprema", 42.99, true, "Rua das Alcachofras, 84", 16.24, 3);
insert into tb_pizza (nome, valor, entrega, endereco_entrega, valor_entrega, categoria_id) values ("VegLove", 51.89, true, "Rua do Cacau, 658", 8.12, 4);
insert into tb_pizza (nome, valor, entrega, endereco_entrega, valor_entrega, categoria_id) values ("Napove", 42.99, true, "Rua Italiana, 7896", 25.64, 3);
insert into tb_pizza (nome, valor, entrega, endereco_entrega, valor_entrega, categoria_id) values ("Gratinatta", 45.39, false, "--", 0, 5);
insert into tb_pizza (nome, valor, entrega, endereco_entrega, valor_entrega, categoria_id) values ("Zucchine", 45.39, true, "Rua dos Estados", 11.73, 5);
insert into tb_pizza (nome, valor, entrega, endereco_entrega, valor_entrega, categoria_id) values ("Shimeji Shack", 42.99, true, "Rua Mario Luigi, 364", 18.53, 2);

select * from tb_pizza where valor > 45;
select * from tb_pizza where valor between 29 and 60;
select * from tb_pizza where nome like "%c%";
select * from tb_pizza inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id;
select * from tb_pizza inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id where tb_categoria.doce = true;
