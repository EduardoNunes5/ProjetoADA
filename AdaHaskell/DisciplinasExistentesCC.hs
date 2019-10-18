module DisciplinasExistentesCC(
 -- lista todas as disciplinas do curso de ciencia da computatacao enumeradas
 listarDisciplinasExistentes,
 -- lista os pre requisitos de uma disciplina
 preRequisitosDeUmaDisciplina,
 -- retorna o nome de uma disciplina que possui o indice passado como parametro
 getDisciplinaPeloIndice
) where

-- C:\Users\Debora\Documents\deb\PLP\haskellPLP\historicosDosAlunos
-- C:\Users\Debora\Documents\deb\PLP\haskellPLP\historicoDisciplina

import qualified Data.Map as Map

main = do
 let (p1:p2) = preRequisitosDeUmaDisciplina "ALGEBRA LINEAR I"
 print $ p1
 print $ p2

 print $ listarDisciplinasExistentes

listarDisciplinasExistentes :: [(Integer, String)]
listarDisciplinasExistentes = do
 gerarDisciplinasEnumeradas (Map.keys (Map.fromList disciplinasExistentes)) 1 []

gerarDisciplinasEnumeradas :: [String] -> Integer -> [(Integer, String)] -> [(Integer, String)]
gerarDisciplinasEnumeradas [] numeroInicial mapaInicial = mapaInicial
gerarDisciplinasEnumeradas (d:ds) numeroInicial mapaInicial = gerarDisciplinasEnumeradas ds (numeroInicial + 1) (mapaInicial ++ [(numeroInicial, d)])

getDisciplinaPeloIndice :: Integer -> String
getDisciplinaPeloIndice indice =  getDisciplinaPeloIndiceRecursivo indice (listarDisciplinasExistentes)

getDisciplinaPeloIndiceRecursivo :: Integer -> [(Integer, String)] -> String
getDisciplinaPeloIndiceRecursivo indice [] = "disciplina inexistente"
getDisciplinaPeloIndiceRecursivo indice (d:ds)
 | indice == (fst d) = snd d
 | otherwise = getDisciplinaPeloIndiceRecursivo indice ds

preRequisitosDeUmaDisciplina :: String -> [String]
preRequisitosDeUmaDisciplina nome = preRequisitosDeUmaDisciplinaRecursivo nome (disciplinasExistentes)

preRequisitosDeUmaDisciplinaRecursivo :: String -> [(String, [String])] -> [String]
preRequisitosDeUmaDisciplinaRecursivo nome [] = []
preRequisitosDeUmaDisciplinaRecursivo nome (x:xs)
 | nome == (fst x) = snd x
 | otherwise = preRequisitosDeUmaDisciplinaRecursivo nome xs 

disciplinasExistentes :: [(String, [String])]
disciplinasExistentes = [("ADMINISTRACAO", []),
	("ADMINISTRACAO DE SISTEMAS", []),
	("ADMINISTRACAO DE SISTEMAS DE INFORMACAO", []),
	("ALGEBRA LINEAR I", ["FUNDAMENTOS DE MATEMATICA PARA CIENCIA DA COMPUTACAO II"]),
	("ALGORITMOS AVANCADOS I", []),
	("ALGORITMOS AVANCADOS II", []),
	("ALGORITMOS AVANCADOS III", []),
	("ANALISE DE SISTEMAS", ["PROGRAMACAO 1","LABORATORIO DE PROGRAMACAO 1"]),
	("ANALISE E TECNICAS DE ALGORITMOS", ["ESTRUTURA DE DADOS", "LABORATORIO DE ESTRUTURA DE DADOS"]),
	("APLICACOES DE GRAFOS",[]),
	("APLICACOES DE PLP",[]),
	("AVALIACAO DE DESEMPENHO DE SISTEMAS DISCRETOS",[]),
	("BANCO DE DADOS 1",["ESTRUTURA DE DADOS"]),
	("BANCO DE DADOS 2",["BANCO DE DADOS 1"]),("BASQUETEBOL FEM",[]),("BASQUETEBOL MAS",[]),
	("CALCULO DIFERENCIAL E INTEGRAL I",["FUNDAMENTOS DE MATEMATICA PARA CIENCIA DA COMPUTACAO I"]),
	("CALCULO DIFERENCIAL E INTEGRAL II",["FUNDAMENTOS DE MATEMATICA PARA CIENCIA DA COMPUTACAO II", "CALCULO DIFERENCIAL E INTEGRAL I"]),
	("CALCULO NUMERICO",[]),
	("CIENCIA DE DADOS DESCRITIVA",[]),("CIENCIA DE DADOS PREDITIVA",[]),
	("COMPILADORES",["PARADIGMAS DE LINGUAGENS DE PROGRAMACAO"]),
	("DESENVOLVIMENTO DE APLICACOES CORPORATIVAS AVANCADAS",[]),("DIREITO E CIDADANIA",[]),("ECONOMIA",[]),
	("ECONOMIA DE TECNOLOGIA DA INFORMACAO",[]),("EMPREENDEDORISMO",[]),("EMPREENDEDORISMO EM SOFTWARE",[]),
	("ENGENHARIA DE SOFTWARE",["PROGRAMACAO 1","LABORATORIO DE PROGRAMACAO 1"]),
	("ESTAGIO INTEGRADO",[]),("ESTAGIO INTEGRADO I",[]),("ESTAGIO INTEGRADO II",[]),
	("ESTAGIO INTEGRADO III",[]),
	("ESTATISTICA APLICADA",["INTRODUCAO A PROBABILIDADE"]),
	("ESTRUTURA DE DADOS",["PROGRAMACAO 2","LABORATORIO DE PROGRAMACAO 2"]),
	("FUNDAMENTOS DE MATEMATICA PARA CIENCIA DA COMPUTACAO I",[]),
	("FUNDAMENTOS DE MATEMATICA PARA CIENCIA DA COMPUTACAO II",["FUNDAMENTOS DE MATEMATICA PARA CIENCIA DA COMPUTACAO I"]),("FUNDAMENTOS DE PROGRAMACAO CONCORRENTE",[]),
	("FUTSAL",[]),("GERENCIA DE REDES DE COMPUTADORES",[]),("GESTAO DE PROJETOS",[]),
	("GESTAO DE SISTEMAS DE INFORMACAO",[]),("GOVERNANCIA DA INTERNET",[]),("INFORMATICA E SOCIEDADE",[]),
	("INGLES",[]),
	("INTELIGENCIA ARTIFICIAL",["TEORIA DA COMPUTACAO"]),
	("INTERCONEXAO DE REDES DE COMPUTADORES",[]),
	("INTRODUCAO A BANCO DE DADOS E MINERACAO DE DADOS",[]),
	("INTRODUCAO A CIENCIA DA COMPUTACAO",[]),
	("INTRODUCAO A COMPUTACAO",[]),
	("INTRODUCAO A PROBABILIDADE",["FUNDAMENTOS DE MATEMATICA PARA CIENCIA DA COMPUTACAO II", "CALCULO DIFERENCIAL E INTEGRAL I"]),
	("JOGOS DIGITAIS",[]),
	("LABORATORIO DE ENGENHARIA DE SOFTWARE",[]),
	("LABORATORIO DE ESTRUTURA DE DADOS",["PROGRAMACAO 2","LABORATORIO DE PROGRAMACAO 2"]),
	("LABORATORIO DE INTERCONEXAO DE REDES DE COMPUTADORES",[]),
	("LABORATORIO DE ORGANIZACAO E ARQUITETURA DE COMPUTADORES",["INTRODUCAO A COMPUTACAO"]),
	("LABORATORIO DE PROGRAMACAO 1",[]),
	("LABORATORIO DE PROGRAMACAO 2",["PROGRAMACAO 1","LABORATORIO DE PROGRAMACAO 1"]),
	("LEITURA E PRODUCAO DE TEXTO",[]),("LINGUA PORTUGUESA",[]),
	("LOGICA PARA COMPUTACAO",["FUNDAMENTOS DE MATEMATICA PARA CIENCIA DA COMPUTACAO II", "CALCULO DIFERENCIAL E INTEGRAL I"]),
	("METODOLOGIA CIENTIFICA",[]),("METODOS E SOFTWARE NUMERICOS",[]),("METODOS ESTATISTICOS",[]),
	("ORGANIZACAO E ARQUITETURA DE COMPUTADORES",["INTRODUCAO A COMPUTACAO"]),
	("PARADIGMAS DE LINGUAGENS DE PROGRAMACAO",["PROGRAMACAO 1","LABORATORIO DE PROGRAMACAO 1"]),
	("PERCEPCAO COMPUTACIONAL",[]),("PRATICA DE ENSINO DE COMPUTACAO I",[]),
	("PRATICA DE ENSINO DE COMPUTACAO II",[]),("PRINCIPIOS DE DESENVOLVIMENTO WEB",[]),
	("PROGRAMACAO 1",[]),("PROGRAMACAO 2",["PROGRAMACAO 1","LABORATORIO DE PROGRAMACAO 1"]),
	("PROGRAMACAO CONCORRENTE",["SISTEMAS OPERACIONAIS"]),
	("PROGRAMACAO FUNCIONAL",[]),("PROJETO DE REDES DE COMPUTADORES",[]),
	("PROJETO DE SISTEMAS OPERACIONAIS",[]),
	("PROJETO DE SOFTWARE",["PROGRAMACAO 1","LABORATORIO DE PROGRAMACAO 1"]),
	("PROJETO DE TRABALHO DE CONCLUSAO DE CURSO",[]),
	("PROJETO EM COMPUTACAO 1",["ENGENHARIA DE SOFTWARE"]),
	("PROJETO EM COMPUTACAO 2",["PROJETO EM COMPUTACAO 1"]),
	("RECUPERACAO DA INFORMACAO E BUSCA NA WEB",[]),
	("REDES DE COMPUTADORES",["INTRODUCAO A COMPUTACAO"]),
	("SEMINARIOS",[]),("SEMINARIOS (EDUCACAO AMBIENTAL)",[]),
	("SISTEMAS DE APOIO A DECISAO",[]),("SISTEMAS DE INFORMACAO II",[]),("SISTEMAS DE RECUPUPERACAO DA INFORMACAO",[]),
	("SISTEMAS OPERACIONAIS",["LABORATORIO DE ORGANIZACAO E ARQUITETURA DE COMPUTADORES"]),
	("SOCIOLOGIA INDUSTRIAL I",[]),
	("TECNICAS DE PROGRAMACAO",[]),
	("TEORIA DA COMPUTACAO",["PARADIGMAS DE LINGUAGENS DE PROGRAMACAO"]),
	("TEORIA DOS GRAFOS",[]),
	("TRABALHO DE CONCLUSAO DE CURSO",["PROJETO DE TRABALHO DE CONCLUSAO DE CURSO"]),
	("VERIFICACAO E VALIDACAO DE SOFTWARE",[]),("VISAO COMPUTACIONAL",[]),("VISUALIZACAO DE DADOS",[])]