# Seance 6 Regressions lineaires et logistiques
# Poly pages 75-87

### A. Univariate linear regression with lm() function

### Data are from the Seance 3 Rdata
load("Data_TP3.RData")

# le modèle est nommé model1
# tous les résultats seront stockés dans model1
model1 <- lm(table$y ~ table$x)
mod <- lm(tp8$score ~ tp8$age)

# La fonction summary afficher les résultats principaux
summary(model1)
summary(mod)
# Alpha (the intercept) is the median value of a person of zero age
# Age does not explain 

# Diagnostic plots
par(mfrow = c(2, 2)) #Permet d'afficher les graphiques 2X2
plot(model1)

# Page 78 remark (not seen in TP)
str(table$a)
modele2 <- lm(table$y ~ table$a)
anova(modele2)
summary(modele2)
table$a_ordre <- factor(table$a, levels = c('one','two','three','four','five'))
modele3 <- lm(table$y ~ table$a_ordre)
summary(modele3)

# Graphical representation
stripchart(table$y ~ table$a, vert=T, pch=16)

table$a_num <- as.numeric(table$a_ordre)

# Define 2 models and get log likelihoods
modele_general <- modele3
modele_restreint <- lm(table$y ~ table$a_num)
anova(modele_restreint)
anova(modele_restreint, model_general)
logLik(modele_restreint)
logLik(modele_general)

# Compare with chi square test (where is modele_complet?)
chi2_a_3ddl <- 2 * (logLik(modele_complet)[1] - logLik(modele_restreint)[1])
1 - pchisq(chi2_a_3ddl, 3)


### B. Multivariate linear regression exercises
model2 <- lm(table$y ~ table$x + table$genre)
# Afficher un résumé des résultats
summary(model2)
summary(lm(table$y ~ table$genre))
plot(model2)

### C. Multivariate linear regression
#La table de données utile à la réalisation de ce TP se trouve dans le
#fichier « tp8_données.Rdata »
load("tp8_données.RData")
# Description de la table
names(tp8)
summary(tp8)

# Description de la table
# Q1 : Look at the distributions of age and score
plot(tp8$age)
plot(tp8$score)

# Histogram
hist(tp8$age)
hist(tp8$score)

# Q2: Perform a LR to see if depression score increases with age
mod.score <- lm(tp8$score ~ tp8$age)
summary(mod.score)

boxplot(tp8$score ~ tp8$sexe)
t.test(tp8$score ~ tp8$sexe, var.equal = T)
# P-value is <0.05 so null hypothesis is rejected
# 95% CI also does not contain 0. Therefore  

mod.score <- lm(tp8$score ~ tp8$sex)
summary(mod.score)

# Residual standard error: part not explained by the model

# Q3
# Assumptions: that x is normally distributed and that variance is constant for all values
class(tp8$pen123)
tp8$pen123num <- as.numeric(tp8$pen123num)
str(tp8)

multi.mod <- lm(score ~ sexe + age + pen123num, dat = tp8)
summary(multi.mod)

# Change order of factor levels to have a different reference
tp8$pen123num <- as.numeric(tp8$pen123)

tp8$pen123_bis <- relevel(tp8$pen123, ref = "Moyenne")

multi.mod <- lm(score ~ sexe + age + pen123num, dat = tp8)
summary(multi.mod)
plot(multi.mod)



summary(lm(tp8$score ~ tp8$pen123num))
# Q4
# Q5
# Q6
# Q7

### B. Logistic regression
logmod <- glm(douleur ~ pen01*sexe + age2, family = binomial, data = tp8)

# model<-glm(y ~ X1 + X2 + …Xi, data=…, family=binomial)

