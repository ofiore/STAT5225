ggsave(filename="AgeHist.pdf", width= 5, height = 5)
ggplot(adrd, aes(x = Age)) +
  geom_histogram(fill = "cornflowerblue", color = "black", binwidth=2) + 
  labs(y="Count")