SELECT 
    e.`id` AS EventID,
    e.`codigo_do_municipio`,
    MAX(e.`data_do_evento`) AS EventDate,
    MAX(p.`nome`) AS CountryName,
    MAX(reg.`nome`) AS RegionName,
    MAX(es.`nome`) AS StateName,
    MAX(m.`nome`) AS MunicipioName,
    MAX(l.`latitude`) AS Latitude,
    MAX(l.`longitude`) AS Longitude,
    GROUP_CONCAT(DISTINCT tc.`titulo`) AS CrimeTypes,
    GROUP_CONCAT(DISTINCT ep.`valor`) AS CrimePropertyValues,
    GROUP_CONCAT(DISTINCT n.`tItulo`) AS NewsTitles,
    GROUP_CONCAT(DISTINCT aut.`nome`) AS AuthorNames,
    GROUP_CONCAT(DISTINCT port.`nome`) AS PortalNames,
    GROUP_CONCAT(DISTINCT t.`nome`) AS Tags,
    GROUP_CONCAT(DISTINCT kw.`keyword`) AS Keywords
FROM `mydb`.`evento` e
JOIN `mydb`.`location_evento` le ON e.`id` = le.`evento_id`
JOIN `mydb`.`location` l ON le.`location_id` = l.`id`
JOIN `mydb`.`pais` p ON l.`pais_id` = p.`id`
JOIN `mydb`.`regiao` reg ON l.`regiao_id` = reg.`id`
JOIN `mydb`.`estado` es ON l.`estado_id` = es.`id`
JOIN `mydb`.`municipio` m ON l.`municipio_id` = m.`id`
LEFT JOIN `mydb`.`evento_propriedade` ep ON e.`id` = ep.`evento_id`
LEFT JOIN `mydb`.`tipo_de_crime` tc ON ep.`tipo_de_crime_id` = tc.`id`
LEFT JOIN `mydb`.`evento_noticia` en ON e.`id` = en.`evento_id`
LEFT JOIN `mydb`.`noticia` n ON en.`noticia_id` = n.`id`
LEFT JOIN `mydb`.`autor` aut ON n.`autor_id` = aut.`id`
LEFT JOIN `mydb`.`portal` port ON n.`portal_id` = port.`id`
LEFT JOIN `mydb`.`noticia_tags` nt ON n.`id` = nt.`noticia_id`
LEFT JOIN `mydb`.`tags` t ON nt.`tags_id` = t.`id`
LEFT JOIN `mydb`.`noticia_raspagem` nr ON n.`id` = nr.`noticia_id`
LEFT JOIN `mydb`.`raspagem` rasp ON nr.`raspagem_id` = rasp.`id`
LEFT JOIN `mydb`.`raspagem_keyword` rk ON rasp.`id` = rk.`raspagem_id`
LEFT JOIN `mydb`.`keyword` kw ON rk.`keyword_id` = kw.`id`
WHERE p.`nome` = "Country B"
GROUP BY e.`id`
ORDER BY e.`id`;

