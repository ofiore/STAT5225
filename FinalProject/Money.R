ggsave(filename="MoneyHist.pdf", width= 5, height = 5)
ggplot(adrd_full, aes(x = PerCapitaIncome)) +
  geom_histogram(fill = "purple", color = "black", binwidth=5000) + 
  labs(y="Count", x = "Per Capita Income")