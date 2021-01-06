

/* 
La procédure CORR utilise les données du fichier "factor2" dans la librairie
"multi" pour produire quelques statistiques de base ainsi que la matrice des corrélations. 
Le "-" dans "x1-x12" est un raccourci qui équivaut é écrire 
"x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12"
(p. 26) 
*/

proc corr data=multi.factor2;
var x1-x12;
run; 


/* 
La procédure FACTOR est utilisée pour faire de l'analyse factorielle exploratoire.
L'analyse sera effectuée sur les variables x1,x2,...,x12.

Voici une bréve explication des options utilisées ci-haut:
method=ml: pour spécifier la méthode utilisée pour estimer les chargements (ici "ml" pour maximum de vraisemblance).
rotate=varimax: pour faire la rotation des facteurs avec la méthode varimax .
maxiter=500: l'algorithme ne fera pas plus de 500 ittérations pour tenter de converger.
nfact=4: pour fixer é 4 le nombre de facteurs. 
hey: permet d'éviter un arrét prématuré du processus d'estimation (explications en classe).
(p. 32)
*/


proc factor data=multi.factor2  method=ml rotate=varimax nfact=4 maxiter=500 flag=.3  hey;
var x1-x12;
run; 


/* 
Ajustement des modéles avec 1, 2, 3 et 5 facteurs afin de choisir le nombre
de facteurs é l'aides des critéres AIC, SBC et du test d'hypothése 
(p. 36)
*/


proc factor data=multi.factor2 method=ml rotate=varimax nfact=1 maxiter=500 flag=.3 hey;
var x1-x12;
run; 
proc factor data=multi.factor2 method=ml rotate=varimax nfact=2 maxiter=500 flag=.3 hey;
var x1-x12;
run; 
proc factor data=multi.factor2 method=ml rotate=varimax nfact=3 maxiter=500 flag=.3 hey;
var x1-x12;
run; 

/* Note: l'option priors=one est nécessaire ici car sinon le modéle é 4 facteurs sera retourné é cause du critére MINEIGEN */
proc factor data=multi.factor2 method=ml rotate=varimax nfact=5 maxiter=500 flag=.3 hey priors=one;
var x1-x12;
run; 


/* 
Ajustement du modéle avec la méthode des composantes principales ("principal"). 
En ne spécifiant pas "nfact", SAS choisit par défaut le nombre 
de facteurs selon le critére des valeurs propres supérieures é 1.
L'option "scree" demande le diagramme d'éboulis.
(p. 39)
*/


proc factor data=multi.factor2 method=principal plots=scree rotate=varimax flag=.3 ;
var x1-x12;
run; 
