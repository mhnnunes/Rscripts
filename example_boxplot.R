# This script creates several boxplots as examples of usage of R tools
# The dataset used is the famous "Iris dataset", introduced by Ronald Fischer
# circa 1936. This dataset is built-in several R distributions.
# If it's not built-in to your distribution, uncomment the code below

# iris <- read.csv(paste(getwd(), '/datasets/iris.csv', sep=''), header=TRUE)

# Using basic R
# One boxplot for each variable
par(mfrow=c(3,2))
boxplot(iris$Sepal.Length, main="Boxplot for Sepal Length")
boxplot(iris$Sepal.Width, main="Boxplot for Sepal Width")
boxplot(iris$Petal.Length, main="Boxplot for Petal Length")
boxplot(iris$Petal.Width, main="Boxplot for Petal Width")
# The boxplot below does not make a lot of sense because the categories are
# evenly distibuted, but it might make sense in other datasets
boxplot(as.numeric(factor(iris$Species)), main="Boxplot for Species")

# One boxplot per variable, per Species
par(mfrow=c(2,2))
boxplot(Sepal.Length~Species, data=iris, main="Sepal Length per Species", 
        xlab="Species", ylab="Sepal length")
boxplot(Sepal.Width~Species, data=iris, main="Sepal Width per Species", 
        xlab="Species", ylab="Sepal width")
boxplot(Petal.Length~Species, data=iris, main="Petal Length per Species", 
        xlab="Species", ylab="Petal length")
boxplot(Petal.Width~Species, data=iris, main="Petal Width per Species", 
        xlab="Species", ylab="Petal width")


# Using ggplot
# IMPORTANT: You MUST have ggplot2 and cowplot installed to execute this part, 
# if you don't, comment this part out or execute the following commands
# to install:
# install.packages('ggplot2')
# install.packages('cowplot')

library(ggplot2)

# cowplot changes the default ggplot theme, revert to original
theme_set(theme_gray())

spl <- ggplot(iris, aes(x = Species, y = Sepal.Length)) +
        theme(
            legend.title=element_blank(),          # theme sets aesthetic 
            legend.text=element_blank(),           # settings for graphic 
            axis.title.x=element_text(size=14),    # elements such as  axis 
            axis.text.x = element_text(size=14),   # title, axis text and legend
            axis.title.y=element_text(size=14),     
            axis.text.y = element_text(size=14)) +  
        geom_boxplot() +
        scale_x_discrete(name='Species') + 
        scale_y_continuous(name='Sepal Length')

spw <- ggplot(iris, aes(x = Species, y = Sepal.Width)) +
        theme(
            legend.title=element_blank(),          # theme sets aesthetic 
            legend.text=element_blank(),           # settings for graphic 
            axis.title.x=element_text(size=14),    # elements such as  axis 
            axis.text.x = element_text(size=14),   # title, axis text and legend
            axis.title.y=element_text(size=14),     
            axis.text.y = element_text(size=14)) +  
        geom_boxplot() +
        scale_x_discrete(name='Species') + 
        scale_y_continuous(name='Sepal Length')

ptl <- ggplot(iris, aes(x = Species, y = Petal.Length)) +
        theme(
            legend.title=element_blank(),          # theme sets aesthetic 
            legend.text=element_blank(),           # settings for graphic 
            axis.title.x=element_text(size=14),    # elements such as  axis 
            axis.text.x = element_text(size=14),   # title, axis text and legend
            axis.title.y=element_text(size=14),     
            axis.text.y = element_text(size=14)) +  
        geom_boxplot() +
        scale_x_discrete(name='Species') + 
        scale_y_continuous(name='Sepal Length')

ptw <- ggplot(iris, aes(x = Species, y = Petal.Width)) +
        theme(
            legend.title=element_blank(),          # theme sets aesthetic 
            legend.text=element_blank(),           # settings for graphic 
            axis.title.x=element_text(size=14),    # elements such as  axis 
            axis.text.x = element_text(size=14),   # title, axis text and legend
            axis.title.y=element_text(size=14),     
            axis.text.y = element_text(size=14)) +  
        geom_boxplot() +
        scale_x_discrete(name='Species') + 
        scale_y_continuous(name='Sepal Length')
# Draw plots in a 2x2 grid using cowplot
# The plots are labeled A to D
cowplot::plot_grid(spl, spw, ptl, ptw, labels='AUTO')
