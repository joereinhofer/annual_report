plot_age_at_length = function(data){
  ggplot(data, aes(x=`WS FINAL AGE`, y=`TL (mm)`))+
    geom_point()+ geom_smooth(se = FALSE) +
    ggtitle("Lake Decatur Walleye")+
    xlab("Age (Whole Spine)") + ylab("Total Length (mm)")+  # note in report they are WS ages
    scale_x_continuous(breaks =  seq(0, max(data[["WS FINAL AGE"]]), 1))+
    scale_y_continuous(breaks =  seq(0, max(data[["TL (mm)"]]), 50))+
    theme_classic()+ 
    theme(plot.title = element_text(hjust = 0.5))
}