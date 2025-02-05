
emotion <- read.csv("/Users/msalan/Downloads/l2emotion-submit.csv")
head(emotion)
max(emotion$Freq)
subset(emotion, Freq == max(emotion$Freq))
#be is the most frequent word and appears 293085 times
subset(emotion, Freq == min(emotion$Freq))
#urinate is the least frequent word and appears 2517 times
boxplot(emotion$Freq)
#the box plot shows that the frequency of most words is usually less than 50,000
hist(emotion$L1.Aro.Mean, main="average arousal of L1 speakers")
hist(emotion$L1.Val.Mean, main="average valence of L1 speakers")
install.packages("psych")
library(psych)
skew(emotion$L1.Val.Mean)
kurtosi(emotion$L1.Val.Mean)
#like i guessed, it is a negative skew of value -0.4168762 
#and is too flat as seen with the negative kurtosi value of -0.4168762
skew(emotion$L1.Aro.Mean)
kurtosi(emotion$L1.Aro.Mean)
#as predicted it is positively skew as seen from the value of 0.482348
#and is too pointy from the positive kurtosi value of 0.09180186
#the information is useful as it shows the degree to which data is concentrated towards one area i.e more strong emotions or how positive/negative words are rated. 
#it is a good indicator of central tendency and if outliers are present
mean(emotion$L1.Val.SD, na.rm=TRUE)
#the value means the degree to which the ratings stray from the mean 
plot(emotion$L1.Val.Mean, emotion$L1.Val.Mean - emotion$L2.Val.Mean,
     xlab="Valence of L1 speakers",
     ylab="L1-L2 Valence"
)
#there is a positive correlation from what i observed in the graph, so more emotional responses by L2
emotion2 <- emotion[,c("L1.Val.Mean","L2.Val.Mean")]
cor(emotion2, method="spearman", use = "complete.obs")
#0.85 coefficient means there is a strong correlation

