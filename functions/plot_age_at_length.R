plot_age_at_length = function(data, title){
  ggplot(data, aes(x=`WS FINAL AGE`, y=`TL (mm)`))+
    geom_point()+ geom_smooth(se = FALSE) +
    ggtitle(title)+
    xlab("Age (Whole Spine)") + ylab("Total Length (mm)")+  # note in report they are WS ages
    scale_x_continuous(breaks =  seq(0,11,1), limits = c(0,11))+
    scale_y_continuous(breaks =  seq(200, 750,50), limits = c(200,750))+
    theme_classic()+ 
    theme(plot.title = element_text(hjust = 0.5))
}