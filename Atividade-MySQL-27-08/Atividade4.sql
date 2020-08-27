/*Crie um banco de dados para um serviço de um açougue, o nome do banco deverá ter o seguinte nome db_cidade_das_carnes, onde o sistema trabalhará com as informações dos produtos desta empresa. 
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
Siga  exatamente esse passo a passo:
- Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço desse açougue.
- Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não esqueça de criar a foreign key de tb_categoria nesta tabela).
- Popule esta tabela Categoria com até 5 dados.
- Popule esta tabela Produto com até 8 dados.
- Faça um select que retorne os Produtos com o valor maior do que 50 reais.
- Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
- Faça um select  utilizando LIKE buscando os Produtos com a letra C.
- Faça um um select com Inner join entre  tabela categoria e produto.
- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são carne).*/

create database db_cidade_das_carnes;

use db_cidade_das_carnes;
create table tb_categoria(
	id bigint (5) auto_increment,
    ave boolean not null,
    suino boolean not null,
    bovino boolean not null,
    primary key (id)
);

create table tb_produto (
	id bigint (5) auto_increment,
    nome varchar (200) not null,
    valor decimal (5,2) not null,
    tipo varchar (200) not null,
    peso decimal (10,3) not null,
    osso boolean,
    categoria_id bigint not null,
    primary key (id),
    foreign key (categoria_id) references tb_categoria (id)
);

insert into tb_categoria (ave, suino, bovino) values (true,false,false);
insert into tb_categoria (ave, suino, bovino) values (false,true,false);
insert into tb_categoria (ave, suino, bovino) values (false,false,true);
insert into tb_categoria (ave, suino, bovino) values (false,true,true);
insert into tb_categoria (ave, suino, bovino) values (false,false,false);

insert into tb_produto (nome, valor, tipo, peso, osso, categoria_id) values ("Conjunto Feijoada", 289.12,"Primeira e segunda", 7.0, true, 4);
insert into tb_produto (nome, valor, tipo, peso, osso, categoria_id) values ("Cupim", 26.45,"Primeira", 1.0, false, 2);
insert into tb_produto (nome, valor, tipo, peso, osso, categoria_id) values ("Frango inteiro", 12.65,"--", 2.0, true, 1);
insert into tb_produto (nome, valor, tipo, peso, osso, categoria_id) values ("Barriga suina", 20.00,"Segunda", 1.5, false, 3);
insert into tb_produto (nome, valor, tipo, peso, osso, categoria_id) values ("Sal do Himalaia", 25.55,"Tempero", 0.110, false, 5);
insert into tb_produto (nome, valor, tipo, peso, osso, categoria_id) values ("Tabua de cortes", 89.90,"Acessórios", 2.0, false, 5);
insert into tb_produto (nome, valor, tipo, peso, osso, categoria_id) values ("Paio", 12.89,"Primeira", 0.400, false, 4);
insert into tb_produto (nome, valor, tipo, peso, osso, categoria_id) values ("Musculo bovino", 8.99,"Segunda", 0.5, false, 2);

select * from tb_produto where valor > 50;
select * from tb_produto where valor between 3 and 60;
select * from tb_produto where nome like "%c%";
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id;
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id where tb_categoria.ave = true;