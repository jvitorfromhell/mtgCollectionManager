# Consultar todas as cartas de um usuario, bem como a quantidade de copias que esse usuario tem dessas cartas
SELECT nomeCarta, COUNT(nomeCarta) FROM CopiaCarta WHERE usuario='jvitorfromhell' GROUP BY nomeCarta;

# Consultar quais usuarios tem determinada carta, bem como o numero de copias que cada usuario tem dessa carta
SELECT usuario, COUNT(copiaID) FROM CopiaCarta WHERE nomeCarta='Heritage Druid' GROUP BY usuario;

# Consulta todas as cartas adquiridas por um usuario via troca, mostrando nome da carta e ID da copia
SELECT Troca.carta, CopiaCarta.nomeCarta FROM Troca, CopiaCarta WHERE destinatario='anaLegs' and Troca.carta = CopiaCarta.copiaID;

# Consultar todas as cartas banidas que um jogador tem, bem como o formato no qual ela eh banida


# Consultar todas as cartas azuis de custo dois ou menos validas no formato Modern que determinado usuario tem em sua colecao


# Consultar todas as copias de cartas que foram trocadas mais de uma vez