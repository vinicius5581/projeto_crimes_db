INSERT INTO `mydb`.`evento` (`id`, `codigo_do_municipio`, `data_do_evento`) VALUES
(1, '110001', '2024-03-10'),
(2, '110002', '2024-04-15');


INSERT INTO `mydb`.`portal` (`id`, `nome`, `website`) VALUES
(1, 'News Portal', 'http://newsportal.com'),
(2, 'Info Hub', 'http://infohub.com');


INSERT INTO `mydb`.`autor` (`id`, `nome`) VALUES
(1, 'John Doe'),
(2, 'Jane Smith');

INSERT INTO `mydb`.`noticia` (`id`, `portal_id`, `autor_id`, `tItulo`, `article`, `data_de_publicacao`, `last_update`, `url`, `relevancia`, `data_de_classificacao_de_relevancia`) VALUES
(1, 1, 1, 'Breaking News', 'This is the content of the breaking news.', '2024-03-08', '2024-03-08', 'http://newsportal.com/breaking-news', 10, '2024-03-08'),
(2, 2, 2, 'Daily Update', 'Content for daily update.', '2024-03-09', '2024-03-09', 'http://infohub.com/daily-update', 5, '2024-03-09');

INSERT INTO `mydb`.`tipo_de_crime` (`id`, `titulo`, `descricao`) VALUES
(1, 'Theft', 'An act of stealing'),
(2, 'Fraud', 'Wrongful or criminal');


INSERT INTO `mydb`.`evento_noticia` (`evento_id`, `noticia_id`) VALUES
(1, 1),
(2, 2);

INSERT INTO `mydb`.`evento_propriedade_titulo` (`id`, `name`, `descricao`) VALUES
(1, 'Property Title 1', 'Description of Property Title 1'),
(2, 'Property Title 2', 'Description of Property Title 2');

INSERT INTO `mydb`.`evento_propriedade_valor` (`id`, `valor`) VALUES
(1, 'Value 1'),
(2, 'Value 2');

INSERT INTO `mydb`.`evento_propriedade` (`id`, `tipo_de_crime_id`, `evento_id`, `evento_propriedade_titulo_id`, `evento_propriedade_valor_id`, `valor`) VALUES
(1, 1, 1, 1, 1, 'Specific Value 1'),
(2, 2, 2, 2, 2, 'Specific Value 2');

INSERT INTO `mydb`.`raspagem` (`id`, `data_de_aquisicao`, `keywords`, `author`) VALUES
(1, '2024-03-08', 'keyword1, keyword2', 'John Doe'),
(2, '2024-03-09', 'keyword3, keyword4', 'Jane Smith');


INSERT INTO `mydb`.`keyword` (`id`, `keyword`) VALUES
(1, 'keyword1'),
(2, 'keyword2'),
(3, 'keyword3'),
(4, 'keyword4');


INSERT INTO `mydb`.`raspagem_keyword` (`raspagem_id`, `keyword_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);

INSERT INTO `mydb`.`modelo_de_relevancia` (`id`, `nome`) VALUES
(1, 'Model 1'),
(2, 'Model 2');

INSERT INTO `mydb`.`noticia_raspagem` (`noticia_id`, `raspagem_id`, `modelo_de_relevancia_id`) VALUES
(1, 1, 1),
(2, 2, 2);

INSERT INTO `mydb`.`tags` (`id`, `nome`, `decricao`) VALUES
(1, 'Tag1', 'Description of Tag1'),
(2, 'Tag2', 'Description of Tag2');

INSERT INTO `mydb`.`noticia_tags` (`noticia_id`, `tags_id`) VALUES
(1, 1),
(2, 2);

INSERT INTO `mydb`.`pais` (`id`, `nome`) VALUES
(1, 'Country A'),
(2, 'Country B');

INSERT INTO `mydb`.`regiao` (`id`, `nome`, `pais_id`) VALUES
(1, 'Region 1', 1),
(2, 'Region 2', 2);

INSERT INTO `mydb`.`estado` (`id`, `nome`, `regiao_id`) VALUES
(1, 'State 1', 1),
(2, 'State 2', 2);

INSERT INTO `mydb`.`municipio` (`id`, `nome`, `ibge_codigo_de_municipio`, `estado_id`) VALUES
(1, 'City 1', '0001', 1),
(2, 'City 2', '0002', 2);

INSERT INTO `mydb`.`location` (`id`, `latitude`, `longitude`, `municipio_id`, `estado_id`, `regiao_id`, `pais_id`) VALUES
(1, '-15.7942287', '-47.8821658', 1, 1, 1, 1),
(2, '-19.9166813', '-43.9344931', 2, 2, 2, 2);


INSERT INTO `mydb`.`location_evento` (`location_id`, `evento_id`) VALUES
(1, 1),
(2, 2);






