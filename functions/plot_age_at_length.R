plot_age_at_length = function(data, title){
  ggplot(data, aes(x=`WS FINAL AGE`, y=`TL (mm)`))+
    geom_point()+ geom_smooth(se = FALSE) +
    ggtitle(title)+
    xlab("Age (Whole Spine)") + ylab("Total Length (mm)")+  # note in report they are WS ages
<<<<<<< HEAD
    scale_x_continuous(breaks =  seq(0,11,1), limits = c(0,11))+
    scale_y_continuous(breaks =  seq(200, 750,50), limits = c(200,750))+
=======
    scale_x_continuous(breaks =  seq(0, max(na.omit(data$`WS FINAL AGE`), limits = c(0,9)), 1))+
    scale_y_continuous(breaks =  seq(0, max(na.omit(data$`TL (mm)`)), 50), limits = c(100, 750))+
>>>>>>> c9ac52befa937d6e41e36dc7d8eb5d101c709f42
    theme_classic()+ 
    theme(plot.title = element_text(hjust = 0.5))
}