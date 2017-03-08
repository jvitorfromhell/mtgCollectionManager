# Consultar todas as cartas de um usuario, bem como a quantidade de copias que esse usuario tem dessas cartas
SELECT nomeCarta, COUNT(nomeCarta) AS quantidade FROM CopiaCarta WHERE usuario='jvitorfromhell' GROUP BY nomeCarta ORDER BY COUNT(nomeCarta) DESC;

# Consultar quais usuarios tem determinada carta, bem como o numero de copias que cada usuario tem dessa carta
SELECT usuario, COUNT(copiaID) AS quantidade FROM CopiaCarta WHERE nomeCarta='Heritage Druid' GROUP BY usuario ORDER BY COUNT(copiaID) DESC;

# Consulta todas as cartas adquiridas por um usuario via troca, mostrando nome da carta, ID da copia e de quem recebeu a copia
SELECT Troca.carta, CopiaCarta.nomeCarta, Troca.remetente FROM Troca, CopiaCarta WHERE destinatario='anaLegs'and Troca.carta = CopiaCarta.copiaID and CopiaCarta.usuario='anaLegs';

# Consultar todas as cartas banidas que um jogador tem, bem como o formato no qual ela eh banida
SELECT DISTINCT carta, formato FROM CartaBanidaFormato, CopiaCarta WHERE CopiaCarta.usuario='leozerah' and CopiaCarta.nomeCarta = CartaBanidaFormato.carta ORDER BY(carta); 

# Consultar todas as cartas azuis de custo dois ou menos validas no formato Modern que determinado usuario tem em sua colecao
SELECT DISTINCT nomeCarta FROM CopiaCarta WHERE usuario = 'freitas' and nomeCarta IN 
	(SELECT nome FROM Carta WHERE cor = 'U' and custo <= 2 and nome IN
		(SELECT DISTINCT carta FROM CartaPertenceBloco WHERE bloco IN (SELECT bloco FROM BlocoValidoFormato WHERE formato='Modern'))
    and nome NOT IN 
		(SELECT carta FROM CartaBanidaFormato WHERE formato='Modern')
	)
;

# Consultar todas as copias de cartas que foram trocadas mais de uma vez, informando ID e usuarios que ja tiveram a copia
SELECT T1.carta, T1.destinatario AS jaTrocou, T2.destinatario AS jaRecebeu FROM Troca AS T1, Troca AS T2 WHERE T1.carta = T2.carta and T2.remetente=T1.destinatario;