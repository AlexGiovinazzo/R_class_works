library(tidyverse)
presidential
ggplot(data = presidential)+
  geom_bar(mapping=aes(x=party, fill = party))+ 
  labs(x = "Political Affiliation" , y = "Count of President", title = "Political Party within the past year")+
  scale_fill_manual(values = c(Republican = 'red', Democratic = 'blue'))

ggplot(data=presidential)+
  geom_point(mapping = aes(x=start, y=end, color = party))+
  scale_color_manual(values = c(Republican = 'red', Democratic = 'blue'))

presidential %>%
  mutate(id = 33 + row_number())%>%
  ggplot()+
  geom_point(mapping=aes(x=start, y= id, color = party))+
  geom_segment(mapping=aes(x=start, y=id, xend=end,yend = id, color = party))+
  scale_color_manual(values = c(Republican = 'red', Democratic = 'blue'))+
  geom_text(mapping=aes(x= start,y = id, label = name, color = party),nudge_x = 1000,nudge_y = .5)


presidential %>%
  mutate(id = 33 + row_number())%>%
  ggplot(mapping=aes(x=start, y= id, color = party))+
  geom_point()+
  geom_segment(mapping=aes(xend=end,yend = id))+
  scale_color_manual(values = c(Republican = 'red', Democratic = 'blue'))+
  geom_text(mapping=aes(label = name),nudge_x = 1000,nudge_y = .5)+
  scale_x_date(name=NULL,breaks = presidential$start,date_labels = '%y')
