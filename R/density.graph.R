

rm(list=ls())
dir = "/home/erika/Dropbox/GIT/DENSITY GRAPH/R/"
setwd(dir)
source('conf/conf.R')
load(file = paste0(dir.input, "dt.data.RData")) 



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


ggsave(d, file = paste0(dir.figures, 'density_1.', nrow(dat), '.png'),   width = 20, height = 20, units = "cm")

#----------------------------------------------- fill --------------------------------------------------------------------------------------------


d <- ggplot(dat, aes(x))
d <- d + geom_histogram(aes(y=..density.., x= S),bins = 15, colour = "black", size = .6, fill = "white", breaks=seq(2.1, 3.5,0.1)) 
d <- d + geom_line(aes(x = x, y = true_densi, colour = 'TRUE'), size = 2) 
d <- d + geom_line(aes(x = x, y = fS, colour = 'SME'), size = .5)  #
d <- d + geom_ribbon(aes(ymin = true_densi, ymax = fS), fill = "pink")
d <- d + xlim(c(2, 4)) 
d <- d + scale_colour_manual("", 
                             breaks = c("TRUE", "SME"),
                             values = c("red", "darkgray")) 
d <- d + xlab('S') + ylab('Density') + theme_bw() + theme(axis.text=element_text(size = 20),axis.title=element_text(size= 20,face="bold"),
                                                          legend.text = element_text(size = 20))

ggsave(d, file = paste0(dir.figures, 'density_2.', nrow(dat), '.png'),   width = 20, height = 20, units = "cm")

#--------------------------------------  alpha ------------------------------------------------------------------------------------------------

d <- ggplot(dat, aes(x))
d <- d + geom_histogram(aes(y=..density.., x= S),bins = 15, colour = "black", size = .6, fill = "white", breaks=seq(2.1, 3.5,0.1)) 
d <- d + geom_line(aes(x = x, y = true_densi, colour = 'TRUE'), size = 2) 
d <- d + geom_line(aes(x = x, y = fS, colour = 'SME'), size = .5)  #
d <- d + geom_ribbon(aes(ymin = true_densi, ymax = fS), fill = "pink", alpha = 0.5)
d <- d + xlim(c(2, 4)) 
d <- d + scale_colour_manual("", 
                             breaks = c("TRUE", "SME"),
                             values = c("red", "darkgray")) 
d <- d + xlab('S') + ylab('Density') + theme_bw() + theme(axis.text=element_text(size = 20),axis.title=element_text(size= 20,face="bold"),
                                                          legend.text = element_text(size = 20))

d

ggsave(d, file = paste0(dir.figures, 'density_3.', nrow(dat), '.png'),   width = 20, height = 20, units = "cm")
#--------------------------------------  shadows ------------------------------------------------------------------------------------------------

d <- ggplot(dat, aes(x))
d <- d + geom_histogram(aes(y=..density.., x= S),bins = 15, colour = "black", size = .6, fill = "white", breaks=seq(2.1, 3.5,0.1)) 
d <- d + geom_line(aes(x = x, y = true_densi, colour = 'TRUE'), size = 2) 
d <- d + geom_line(aes(x = x, y = fS, colour = 'SME'), size = .5)  #
d <- d + geom_ribbon(aes(ymin = true_densi, ymax = fS), fill = "pink", alpha = 0.5)
d <- d + geom_ribbon(aes(ymin = 0, ymax = true_densi), fill = "cornsilk2", alpha = 0.5)
d <- d + xlim(c(2, 4)) 
d <- d + scale_colour_manual("", 
                             breaks = c("TRUE", "SME"),
                             values = c("red", "darkgray")) 
d <- d + xlab('S') + ylab('Density') + theme_bw() + theme(axis.text=element_text(size = 20),axis.title=element_text(size= 20,face="bold"),
                                                          legend.text = element_text(size = 20))

ggsave(d, file = paste0(dir.figures, 'density_4.', nrow(dat), '.png'),   width = 20, height = 20, units = "cm")

#-----------------------------------------------------------------------------------------------------------------------------------------------



