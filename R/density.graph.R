
#save(dat, file = paste0(dir, "dt.data.RData")) 
rm(list=ls())
dir <- '/home/erika/Dropbox/GIT/DENSITY GRAPH/R/'
load(file = paste0(dir, "dt.data.RData")) 

head(dat)
#source('fun_fig.R') # configuration of the figures
d <- NULL
d <- ggplot(dat, aes(y=..density..,x= S)) + geom_histogram(bins = 15, colour = "black", size = .6, fill = "white", breaks=seq(2.1, 3.5,0.1)) 
d <- d + geom_line(aes(x = x, y = true_densi, colour = 'TRUE'), size = 2)  #+   stat_smooth(se = FALSE) 
d <- d + geom_line(aes(x = x, y = fS, colour = 'SME'), size = .2)  #+   stat_smooth(se = FALSE) 
d <- d + geom_point(aes(x = x, y = fS, colour = 'SME'), size = 1) 
d <- d + xlim(c(2, 4)) 
d <- d + scale_colour_manual("", 
                             breaks = c("TRUE", "SME"),
                             values = c("black", "darkgray")) 
d <- d + xlab('S') + ylab('Density') + theme_bw() + theme(axis.text=element_text(size = 20),axis.title=element_text(size= 20,face="bold"),
                                                          legend.text = element_text(size = 20))
d

save(dat, file = paste0(dir, "dt.data.RData")) 
ggsave(d, file = paste0(dir, 'SME_LOG_', nrow(dat), '.png'),   width = 20, height = 20, units = "cm")

