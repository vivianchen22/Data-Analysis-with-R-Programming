library(library)
library(palmerpenguins)
View(penguins)

#visualize different species by color & shape
penguins %>% ggplot(aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(shape=species,colour=species))

#visualize different species by alpha and size, color outside of aes() meaning changing overall color, not related to any specific variable
penguins %>% ggplot(aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(alpha=species,size=species),color="red")

#visualize data by smooth line
penguins %>% ggplot(aes(x=flipper_length_mm,y=body_mass_g))+geom_point()+geom_smooth()

#visualize data by smooth line & each line stands for different species
penguins %>% ggplot(aes(x=flipper_length_mm,y=body_mass_g))+geom_smooth(aes(linetype=species))

#instead of geom_point, using geom_jitter to make the point easier to find
penguins %>% ggplot(aes(x=flipper_length_mm,y=body_mass_g))+geom_jitter()

#facet_wrap
penguins %>% ggplot(aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(color=species))+facet_wrap(~species)

#facet_grid, if 2 variable
penguins %>% ggplot(aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(color=species))+facet_grid(sex~species)

#facet_grid 1 variable only
penguins %>% ggplot(aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(color=species))+facet_grid(~species)

#title,subtitle,caption
penguins %>% ggplot(aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(shape=species,colour=species))+labs(title="Penguin Analysis",subtitle="flipper_length vs body_mass",caption="data by Dr. Kristen Gorman")

#annotate text, customized text color,font weight, size,angle
penguins %>% ggplot(aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(shape=species,colour=species))+labs(title="Penguin Analysis",subtitle="flipper_length vs body_mass",caption="data by Dr. Kristen Gorman")+annotate("text",x=250,y=2000,label="Gentoo are the largest penguin",color="red",fontface="bold",size=5,angle=25)

#when the code is too long, can save the code in variable 
p <-penguins %>% ggplot(aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(shape=species,colour=species))+labs(title="Penguin Analysis",subtitle="flipper_length vs body_mass",caption="data by Dr. Kristen Gorman")
p +annotate("text",x=250,y=2000,label="Gentoo are the largest penguin",color="red",fontface="bold",size=5,angle=25)



View(diamonds)

#barchart
diamonds %>% ggplot(aes(x=cut))+geom_bar()

#barchart different colors
diamonds %>% ggplot(aes(x=cut))+geom_bar(aes(color=cut))

#barchart different fills
diamonds %>% ggplot(aes(x=cut))+geom_bar(aes(fill=cut))

#segmented barchart by fills
diamonds %>% ggplot(aes(x=cut))+geom_bar(aes(fill=clarity))

#facet_wrap
diamonds %>% ggplot(aes(x=cut))+geom_bar(aes(fill=cut))+facet_wrap(~cut)

#save chart
diamonds %>% ggplot(aes(x=cut))+geom_bar(aes(fill=cut))+facet_wrap(~cut)
ggsave("test.png")








