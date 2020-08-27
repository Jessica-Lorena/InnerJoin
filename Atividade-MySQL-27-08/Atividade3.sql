/*Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as informações dos produtos desta empresa. 
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
Siga  exatamente esse passo a passo:
- Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.
- Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço deste farmacia(não esqueça de criar a foreign key de tb_categoria nesta tabela).
- Popule esta tabela Categoria com até 5 dados.
- Popule esta tabela Produto com até 8 dados.
- Faça um select que retorne os Produtos com o valor maior do que 50 reais.
- Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
- Faça um select  utilizando LIKE buscando os Produtos com a letra B.
- Faça um um select com Inner join entre  tabela categoria e produto.
- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são cosméticos).*/

create database db_farmacia_do_bem;

use db_farmacia_do_bem;
create table tb_categoria(
	id bigint (5) auto_increment,
    receita boolean not null,
    higiene boolean not null,
    cosmetico boolean not null,
    primary key (id)
);

create table tb_produto (
	id bigint (5) auto_increment,
    nome varchar (200) not null,
    valor decimal (5,2) not null,
    tipo varchar (200) not null,
    quantidade varchar (200) not null,
    interno_externo varchar (200) not null,
    categoria_id bigint not null,
    primary key (id),
    foreign key (categoria_id) references tb_categoria (id)
);

insert into tb_categoria (receita, higiene, cosmetico) values (false,false,false);
insert into tb_categoria (receita, higiene, cosmetico) values (true,false,false);
insert into tb_categoria (receita, higiene, cosmetico) values (false,false,true);
insert into tb_categoria (receita, higiene, cosmetico) values (false,true,true);
insert into tb_categoria (receita, higiene, cosmetico) values (false,true,false);

insert into tb_produto (nome, valor, tipo, quantidade, interno_externo, categoria_id) values ("Hemifurato de Quetiapina", 72.37,"Comprimido", "25mg, 30 comprimidos", "Interno", 2);
insert into tb_produto (nome, valor, tipo, quantidade, interno_externo, categoria_id) values ("Inalador", 279.89,"Aparelho doméstico", "6 peças", "Externo", 1);
insert into tb_produto (nome, valor, tipo, quantidade, interno_externo, categoria_id) values ("Yamasterol Less Poo", 32.30,"Shampoo", "900ml", "Externo", 4);
insert into tb_produto (nome, valor, tipo, quantidade, interno_externo, categoria_id) values ("Vitacid", 27.09,"Ácido - Gel", "0,25mg/g, 25g", "Externo", 3);
insert into tb_produto (nome, valor, tipo, quantidade, interno_externo, categoria_id) values ("Lenços umedecidos", 11.19,"Infantil", "50 unidades", "Externo", 5);
insert into tb_produto (nome, valor, tipo, quantidade, interno_externo, categoria_id) values ("Balança", 89.99,"Aparelho doméstico", "1 peça", "Externo", 1);
insert into tb_produto (nome, valor, tipo, quantidade, interno_externo, categoria_id) values ("Anthelios", 60.27,"Protetor solar", "40g", "Externo", 3);
insert into tb_produto (nome, valor, tipo, quantidade, interno_externo, categoria_id) values ("Monitor de pressão arterial de pulso", 119.00,"Aparelho doméstico", "1 peça", "Externo", 1);

select * from tb_produto where valor > 50;
select * from tb_produto where valor between 3 and 60;
select * from tb_produto where nome like "%b%";
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id;
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id where tb_categoria.cosmetico = true;