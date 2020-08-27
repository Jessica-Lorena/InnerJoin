/*Crie um banco de dados para um serviço de uma loja de produtos de construção, o nome do banco deverá ter o seguinte nome db_construindo_a_nossa_vida, onde o sistema trabalhará com as informações dos produtos desta empresa. 
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
Siga  exatamente esse passo a passo:
- Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço deste ecommerce.
- Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço de uma loja de produtos (não esqueça de criar a foreign key de tb_categoria nesta tabela).
- Popule esta tabela Categoria com até 5 dados.
- Popule esta tabela Produto com até 8 dados.
- Faça um select que retorne os Produtos com o valor maior do que 50 reais.
- Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
- Faça um select  utilizando LIKE buscando os Produtos com a letra C.
- Faça um um select com Inner join entre  tabela categoria e produto.
- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são da categoria hidráulica).*/

create database db_construindo_a_nossa_vida;

use db_construindo_a_nossa_vida;
create table tb_categoria(
	id bigint (5) auto_increment,
    ferramenta boolean not null,
    banheiro boolean not null,
    cozinha boolean not null,
    primary key (id)
);

create table tb_produto (
	id bigint (5) auto_increment,
    nome varchar (200) not null,
    valor decimal (10,2) not null,
    quantidade int (10) not null,
    peso decimal (10,3) not null,
    material varchar (200) not null,
    categoria_id bigint not null,
    primary key (id),
    foreign key (categoria_id) references tb_categoria (id)
);

insert into tb_categoria (ferramenta, banheiro, cozinha) values (true,false,false);
insert into tb_categoria (ferramenta, banheiro, cozinha) values (false,true,false); 
insert into tb_categoria (ferramenta, banheiro, cozinha) values (false,false,true);
insert into tb_categoria (ferramenta, banheiro, cozinha) values (false,true,true);
insert into tb_categoria (ferramenta, banheiro, cozinha) values (false,false,false);

insert into tb_produto (nome, valor, quantidade, peso, material, categoria_id) values ("Porta", 219.99,1,38.100, "MDF", 4);
insert into tb_produto (nome, valor, quantidade, peso, material, categoria_id) values ("Vaso Sanitário", 326.99,1,25.610, "Porcelana", 2);
insert into tb_produto (nome, valor, quantidade, peso, material, categoria_id) values ("Fita Isolante", 11.99,33,0.065, "PVC", 5);
insert into tb_produto (nome, valor, quantidade, peso, material, categoria_id) values ("Martelo", 69.99,2,0.864, "Aço", 1);
insert into tb_produto (nome, valor, quantidade, peso, material, categoria_id) values ("Coifa", 2789.90,1,14.1, "Aço Inox", 3);
insert into tb_produto (nome, valor, quantidade, peso, material, categoria_id) values ("Alicate", 44.99,1,0.160, "Aço", 1);
insert into tb_produto (nome, valor, quantidade, peso, material, categoria_id) values ("Chuveiro", 129.99,1,0.540, "Termoplástico", 2);
insert into tb_produto (nome, valor, quantidade, peso, material, categoria_id) values ("Caixa Organizadora", 129.90,6,0.575, "Plástico", 5);

select * from tb_produto where valor > 50;
select * from tb_produto where valor between 3 and 60;
select * from tb_produto where nome like "%c%";
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id;
select * from tb_produto inner join tb_categoria on tb_categoria.id = tb_produto.categoria_id where tb_categoria.ferramenta = true;