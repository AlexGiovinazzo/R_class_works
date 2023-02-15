library(tidyverse)
library(nycflights13)
flights
A<-filter(flights,dep_delay>500)
A

ggplot(data=A)+
  geom_point(mapping=aes(x=month,y=dep_delay))

B<- filter(flights,dep_delay>=120 & dep_delay <=180)

ggplot(data=B)+
  geom_point(mapping=aes(x=month,y=dep_delay))

C<- filter(flights, dep_delay>= 60& arr_delay<=60)

C

ggplot(data=C)+
  geom_point(mapping=aes(x=dep_delay,y=arr_delay,color=carrier))

mutate(flights,made_up= dep_delay - arr_delay)

D<- select(flights,month,dep_delay,arr_delay,carrier)

D

E<- mutate(D,made_up = dep_delay - arr_delay)

E

ggplot(data=E)+
  geom_point(mapping=aes(x=month,y=made_up))+
  facet_wrap(~carrier)

arrange(E,made_up)
arrange(E,desc(made_up))

F<- filter(E,made_up > 30 & made_up < 60)

ggplot(data=F)+
  geom_point(mapping=aes(x=month,y=made_up))+
  facet_wrap(~carrier)

flights %>%
  select(month,contains('delay'),carrier) %>%
  mutate(made_up = dep_delay - arr_delay) %>%
  filter(made_up >= 30 & made_up <= 60) %>%
  ggplot() +
  geom_point(mapping=aes(x=month,y=made_up)) + 
  facet_wrap(~carrier)

flights %>%
  select(month,sched_arr_time,distance)%>%
  filter(distance >=900)%>%
  summarise(mean_dist = mean(distance),mean_arrival_time = mean(sched_arr_time))
