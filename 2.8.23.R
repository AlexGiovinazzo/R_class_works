library(tidyverse)
mpg


mpg %>%
  ggplot()+
  geom_point(mapping=aes(x = displ, y = hwy,color = class))+
  labs(
    x= "Engine Displacement (L)",
    y= "Highway Fuel Efficiency (MPG)",
    color = "Car type"
  )+
  labs(
    title = "Fuel efficiency decreases with engine size",
    subtitle = "Two seater(sports cars) are an exception",
    caption = "Data from wherever"
  )

best_in_class <- mpg %>%
  group_by(class)%>%
  filter(dense_rank(desc(hwy)) == 1 )

best_in_class

ggplot(data=mpg)+
  geom_point(mapping=aes(x = displ, y = hwy,color = class))+
  labs(
    x= "Engine Displacement (L)",
    y= "Highway Fuel Efficiency (MPG)",
    color = "Car type"
  )+
  labs(
    title = "Fuel efficiency decreases with engine size",
    subtitle = "Two seater(sports cars) are an exception",
    caption = "Data from wherever"
  )+
  geom_label(data=best_in_class, mapping=aes(x = displ, y = hwy, label = model),nudge_y = 2, alpha = .5)
  

label <- mpg%>%
  summarise(
    displ = max(displ),
    hwy = max(hwy),
    label = "Increaseing engine size is related to \ndecreasing feul efficiency"
  )

label

ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+
  geom_point()+
  geom_text(data = label,mapping = aes(x=displ,y=hwy,label = label),vjust = "top",hjust = "right")

mpg %>%
  group_by(class)%>%
  summarise(hwy = max(hwy))

base <- ggplot(data=mpg, mapping=aes(x=displ,y=hwy))+
  geom_point(mapping = aes(color = class))

base+ theme(legend.position = "top")

base+ geom_smooth()+ coord_cartesian(xlim=c(1.5,5),ylim=c(15,45))


x_scale <- scale_x_continuous(limits =range(mpg$displ))
y_scale <- scale_y_continuous(limits = range(mpg$hwy))


mpg%>%
  filter(class == 'suv')%>%
  ggplot(mapping = aes (x = displ , y = hwy))+
  geom_point()+x_scale+y_scale

mpg%>%
  filter(class == 'compact')%>%
  ggplot(mapping = aes (x = displ , y = hwy))+
  geom_point()+x_scale+y_scale