# Examen R et statistiques 2023 rattrapage
library(medicaldata)
library(faraway)
library(aplore3)

# Donnees :
hemoglobin # Measurements of hb in children before and after a treatment
diabetes # data on diabetes markers and physical characteristics of 403 participants
nhanes

# Q1
a <- c(1,2,3,4)
b <- c('a', 'b', 'c', 'd')
data.frame(a, b)

# Q14
plot(rnorm(100))
plot(runif(100))
barplot(rnorm(100))
hist(runif(100))

# Q18
cor.test(diabetes$glyhb, diabetes$hdl)

# Q20
t.test(post ~ treatment, data = hemoglobin)

# Q21
chisq.test(diabetes$gender, diabetes$frame)

# Q22, Q23
library(epitools)
tab <- table(AP.mod = nhanes$modrecexr, Obese = nhanes$obese)
epitab(tab, method = "oddsratio", pvalue = "chi2", rev = "rows")

# Q24
summary(lm(waist ~ gender + chol + glyhb + hdl, data = diabetes))

# Q26
nhanes$obese1 <- as.numeric(nhanes$obese) - 1
mod <- glm(obese1 ~ gender + ht + age + tchol + hdl, family = "binomial", data = nhanes)
summary(mod)

# Q27
log(mod$coefficients)
exp(mod$coefficients)
mod$coefficients
mod$fitted.values

# Q29
summary(lm(glyhb ~ waist + gender, data = diabetes))


