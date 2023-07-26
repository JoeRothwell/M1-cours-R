# Examen R et statistiques 2023

# Jeux de donnees
# Exam anxiety dataset, correlation and t-test

library(medicaldata)
library(faraway)
library(aplore3)

# Potential datasets to use
women # heights and weights of 15 women. Question on correlation?
cor.test(women$height, women$weight)
summary(lm(height ~ weight, dat = women))

diabetes # data on diabetes markers and physical characteristics of 403 participants
# question on making diabetes variable glyhb > 0.7

drugpsy # Numbers of people with different disorders choosing a drug or not

hemoglobin # Measurements of hb in children before and after a treatment

nhanes # Sedentary minutes and obesity (for t-test?)
t.test(sedmin ~ obese, dat = nhanes)
