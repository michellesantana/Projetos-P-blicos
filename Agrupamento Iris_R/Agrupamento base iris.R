data (iris)

?iris #Traz informações sobre a base de dados

#Eliminando a coluna Species
iris$Species<-NULL 

iris<-data.frame(scale(iris))
iris  

grupos<-hclust(dist(iris)) #por default a distância utilizada é a distância euclidiana
?hclust #entendendo sobre a função hclust
grupos


#utilizando outro método, diferente do padrão
grupos<-hclust(method="centroid",dist(iris))
grupos
  

#cortando os grupos
sub_grupos<- cutree(grupos,k=3)
table(sub_grupos) #olhando a frequência de cada grupo

plot(grupos) #Dendogramas
rect.hclust(grupos, k=3, border = 2:3)#Esse comando separa visualmente os grupos

#função abaixo usa ACP e mostra os grupos em duas dimensões
library(factoextra) #se ao chamar a biblioteca, der erro, deve-se instalar primeiro
fviz_cluster(list(data = iris, cluster = sub_grupos))
fviz_nbclust(iris,FUN = hcut, method = "wss") #encontrando nº ótimo de clusters
#wss = total within sum of square


#Kmeans

kmeans(iris, centers = 3, iter.max = 10)


