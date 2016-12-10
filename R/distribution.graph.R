

rm(list=ls())
dir = "/home/erika/Dropbox/GIT/DENSITY GRAPH/R/"
setwd(dir)
source('conf/conf.R')
load(file = paste0(dir.input, "dt.data.RData")) 

#source('fun_fig.R') # configuration of the figures
d <- ggplot(dat) 
d <- d + geom_line(aes(x = S, y = F_Empirical, colour = 'DATA'), size = 2)  #+   stat_smooth(se = FALSE) 
d <- d + geom_line(aes(x = S, y = F_real, colour = 'TRUE'), size = 1.5) #+ xlim(c(2, 3.7))
d <- d + geom_line(aes(x = S, y = F_maxent, colour = 'SME'), size = .8)  #+   stat_smooth(se = FALSE) 
d <- d + scale_colour_manual("", 
                             breaks = c("DATA", "TRUE", "SME"),
                             values = c('red', "black", "darkgray"))
d <- d + xlab('S') + ylab('CDF') + theme_bw() + theme(axis.text=element_text(size = 20),axis.title=element_text(size= 20,face="bold"))
d

ggsave(d, file = paste0(dir.figures, 'CH7_SME_CUM', '.png'),   width = 20, height = 20, units = "cm")

#-----------------------------------------------------------------------------------------------------------------------------------------------

# OTHER GRAPHS

DistributionPlot <- function(S, F_e, F){
  
  SS = sort(S[S > 0])
  plot(SS, F_e, type="l", lwd = 3.5, lty = 6, main = "Empirical and SME CDF", ylab = "F",xlab = "S")
  lines(SS,F,col="red",lty=2, lwd = 3.5)
  legend(max(SS) - 4, 0.4, c("Empirical","SME"), lty = c(6,4), lwd = c(3.5,2.5),col = c("black","red")) 
  
  #cat(rep("\n", 50)) #clean screen
  #diffF <-  abs(F_e - F) 
  #cat("Max. difference between distributions:", max(diffF), "\n")
  #abline(v = SS[which(diffF ==max(diffF))], col = "green")
  #abline(h = F_e[which(diffF ==max(diffF))], col = "green")
  #abline(h = F[which(diffF ==max(diffF))], col = "green")
  #text(max(SS[which(diffF ==max(diffF))]), y = mean(max(F_e[which(diffF == max(diffF))]) + max( F[which(diffF == max(diffF))])),"max")
  #cat("Max. difference between distributions:", SS[which(diffF ==max(diffF))], "\n")
  
  return(0)
}

#REALIABILITY DIAGRAM
DrawRealiabilityDiagram <- function(F, F_e, S){
  
  SS <- sort(S[S > 0])
  #here we need consider quantiles (I don't want consider all the points)
  qq <- round(seq(0, length(SS)-1, length = (length(SS)/2)))
  
  if (length(qq) < 100){
    lol <- length(qq)
  }else{
    lol <- 100
  }
  
  quantiles <- sample(qq, lol, replace = FALSE, prob = NULL)
  sampF     <- F[quantiles]
  sampF_e   <- F_e[quantiles]
  q <- seq(0, 1, 0.1) # diagonal
  par(ps = 12, cex.lab = 1.5, cex.main = 1.5) #, ,cex=.5,cex.lab=.5, cex.axis=.5, cex.main=.5
  plot(q, q, type = "l", xlab = "SME Probability", ylab = "Empirical Probability", ylim = c(0,1), xlim = c(0,1)) #, main = "Reliability Diagram"
  points(sampF_e, sampF, pch = 15)
  
  return(0)
}

#----------------------------------------------------------------------------------------------------
#CALIBRATION DIAGRAM
DrawCalibrationDiagram <- function(F, F_e, S){
  
  SS <- sort(S[S > 0])
  par(ps = 12, cex.lab = 1.5, cex.main = 1.5) #, ,cex=.5,cex.lab=.5, cex.axis=.5, cex.main=.5
  plot(SS, F_e - F, type = "l", xlab = "S", ylab = "Empirical- SME", ylim = c(-0.1,0.1)) #, main = "Calibration Diagram"
  abline(h = 0, col="black",lty="dotted")
  
  return(0)
}

