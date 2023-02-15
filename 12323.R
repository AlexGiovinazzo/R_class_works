library(tidyverse)

ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ,y=hwy),color='blue')+
  geom_smooth(mapping=aes(x=displ,y=hwy),color='blue')+
  geom_point(mapping=aes(x=displ,y=cty),color='red')+
  geom_smooth(mapping=aes(x=displ,y=cty),color='red')+
  facet_wrap(~class)

#Bar Graph
ggplot(data=mpg)+
  geom_bar(mapping=aes(x=class))

#What you fill the bar with
ggplot(data=mpg)+
  geom_bar(mapping=aes(x=class,fill=drv))

#puts fills next to eachother
ggplot(data=mpg)+
  geom_bar(mapping=aes(x=class,fill=drv),position = 'dodge')

ggplot(data=mpg)+
  geom_boxplot(mapping=aes(x=class,y=hwy))+
  coord_flip()

library(nycflights13)
flights

ggplot(data=flights)+
  geom_point(mapping=aes(x=month,y=dep_delay))

flights %>% 
  filter(dep_delay>500) %>%
  ggplot()+
  geom_point(mapping=aes(x=month, y=dep_delay))

flights %>% 
  filter(dep_delay>500) %>%
  ggplot()+
  geom_bar(mapping=aes(x=month))

flights

ggplot(data=flights)+
  geom_point(mapping=aes(x=day,y=sched_dep_time - dep_time))

colnames()