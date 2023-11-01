#TRABAJO R Carla Mesquida Reig

getwd()

#1. Carga los datos y exáminalos en R. Emplea las funciones head(),
summary(), dim() y str(). ¿Cuántas variables hay? ¿Cuántos
tratamientos? Hay 2 variables y 5 tratamientos.
data <- read.table("datos-trabajoR.txt",header=TRUE)
datos <- data
head(data)
summary(data)
dim (data)
str(data)

#2. Haz un boxplot para nuestros datos. Uno para cada variable.
Colorea a Variable 1 y a Variable 2 de forma diferente (guarda esos
colores para las siguientes gráficas)
boxplot(data$Variable1 ~ Tratamiento, data =data)
boxplot(data$Variable2 ~ Tratamiento, data =data)
boxplot(data$Variable1 ~ Tratamiento, data =data, main="Boxplot de Variable1", ylab="Valor", col="green", border="black")
boxplot(data$Variable2 ~ Tratamiento, data =data, main="Boxplot de Variable1", ylab="Valor", col="red", border="black")



#3. Haz un gráfico de dispersión con las dos variables. Cada
tratamiento debe de ir de un color distinto. ¡Como en la siguiente
imagen! Pista: usa col=datos$Tratamiento
Variable1 <- data$Variable1
Variable2 <- data$Variable2
Tratamiento <- data$Tratamiento
plot(Variable1 ~ Variable2)
plot(data$Variable1, data$Variable2, xlab = "V1", ylab = "V2", pch = 19, col = (data$Tratamiento))

#4. Ponle leyenda al gráfico del apartado anterior. En el margen inferior
derecho. Pista: investiga sobre legend()
legend("bottomright", legend = unique(data$Tratamiento), title = "Tratamientos", col = 1:length(unique(data$Tratamiento)), pch = 19)

#5. Haz un histograma para cada variable. Recuerda mantener los
colores.
hist(Variable1, col="green")
hist(Variable2, col="red")

#6. Haz un factor en la columna tratamiento y guárdalo en una
variable. Pista: factor(factor$Tratamiento)
data$factor.tratamiento = factor(data$Tratamiento)
summary(data)

#7. Calcula la media y la desviación estándar para cada tratamiento. Recomendación: es
más fácil si usas aggregate() o tapply().
• aggregate(Variable~factor,datos,función)
• tapply(datos$Variable,factor,función)
V1.mean = tapply(data$Variable1, data$Tratamiento, mean)
V2.mean = tapply(data$Variable2, data$Tratamiento, mean)
V1.sd = tapply(data$Variable1, data$Tratamiento, sd)
V2.sd = tapply(data$Variable2, data$Tratamiento, sd)
head(V1.mean)
head(V2.mean)
head(V1.sd)
head(V2.sd)

#8. Averigua cuántos elementos tiene cada tratamiento. Recomendación: es más fácil siusas table() con el factor
data$Tratamiento_Factor = factor(data$Tratamiento)
elementos.tratamiento = table(data$Tratamiento_Factor)
print(elementos.tratamiento)

#9. Extrae los datos para el tratamiento 1 y el tratamiento 4 y guárdalos cada uno en una
variable diferente.
T.1 = data[data$Tratamiento == 1, ]
T.4 = data[data$Tratamiento == 4, ]
T.1
T.4

#10. Nuestra hipótesis nula es que las medias de tratamiento 1 y tratamiento 4 para la
Variable 1 son iguales. ¿Puedes comprobarlo? Para ello, necesitarás comprobar
primero si los datos se distribuyen de forma normal. En función del resultado de la
prueba de normalidad, ¿qué test usarías? ** En general, asumimos que las muestras
son independientes, pero ¿son sus varianzas iguales? Actúa de acuerdo a tus
resultados.                         
#Lo comprobamos con el test Saphiro, la distribución es normal. 
shapiro.test(T.1$Variable1)
shapiro.test(T.4$Variable1)

#Comprobamos las varianzas, son diferentes por p value menor 
var.test(T.1$Variable1, T.4$Variable1)

#Realizo un t-student para comparar las medias 
t.test(Variable1,Tratamiento,var.equal=TRUE)
#como p value es menor que 0,05 significa que las medias son diferentes y rechazamos la hipótesis nula de que las medias de tratamiento 1 y 4 para la variable 1 son iguales