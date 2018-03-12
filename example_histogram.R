# This script creates several histograms as examples of usage of R tools
# The dataset used is the famous "Iris dataset", introduced by Ronald Fischer
# circa 1936. This dataset is built-in several R distributions.
# If it's not built-in to your distribution, uncomment the code below

# iris <- read.csv(paste(getwd(), '/datasets/iris.csv', sep=''), header=TRUE)

par(mfrow=c(2,2))
hist(iris$Sepal.Length,
          main="Distribution of Sepal Length",
          xlab="Sepal Length")
hist(iris$Sepal.Width,
     main="Distribution of Sepal Width",
     xlab="Sepal Width")
hist(iris$Petal.Length,
     main="Distribution of Petal Length",
     xlab="Petal Length")
hist(iris$Petal.Width,
     main="Distribution of Petal Width",
     xlab="Petal Width")

# Generate density plots for the same data
spl <- density(iris$Sepal.Length)
spw <- density(iris$Sepal.Width)
ptl <- density(iris$Petal.Length)
ptw <- density(iris$Petal.Width)
par(mfrow=c(2,2))
plot(spl, main='Distribution of Sepal Lengths', xlab='Lengths')
plot(spw, main='Distribution of Sepal Widths', xlab='Widths')
plot(ptl, main='Distribution of Petal Lengths', xlab='Lengths')
plot(ptw, main='Distribution of Petal Widths', xlab='Widths')

# Using ggplot
# IMPORTANT: You MUST have ggplot2 and cowplot installed to execute this part, 
# if you don't, comment this part out or execute the following commands
# to install:
# install.packages('ggplot2')
# install.packages('cowplot')

library(ggplot2)

# Histograms for the Iris dataset, showing the distribution of each variable
# for each Species
# cowplot changes the default ggplot theme, revert to original
theme_set(theme_gray())

spl <- ggplot(iris, aes(x=Sepal.Length, fill=Species, color=Species)) + 
        geom_histogram(position='identity') +
        # Colorblind safe color scale
        scale_fill_brewer(type="qual", palette=2, direction=1) +
        scale_x_discrete(name='Sepal Lengths') +
        scale_y_continuous(name='Frequency')

spw <- ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) + 
        geom_histogram(position='identity') +
        # Colorblind safe color scale
        scale_fill_brewer(type="qual", palette=2, direction=1) +
        scale_x_discrete(name='Sepal Widths')+
        scale_y_continuous(name='Frequency')

ptl <- ggplot(iris, aes(x=Petal.Length, fill=Species, color=Species)) + 
        geom_histogram(position='identity') +
        # Colorblind safe color scale
        scale_fill_brewer(type="qual", palette=2, direction=1) +
        scale_x_discrete(name='Petal Lengths')+
        scale_y_continuous(name='Frequency')

ptw <- ggplot(iris, aes(x=Petal.Width, fill=Species, color=Species)) + 
        geom_histogram(position='identity') +
        # Colorblind safe color scale
        scale_fill_brewer(type="qual", palette=2, direction=1) +
        scale_x_discrete(name='Petal Widths')+
        scale_y_continuous(name='Frequency')
# Draw plots in a 2x2 grid using cowplot
# The plots are labeled A to D
cowplot::plot_grid(spl, spw, ptl, ptw, labels='AUTO')


# Density plots for the same dataset
theme_set(theme_gray())

spl <- ggplot(iris, aes(x=Sepal.Length, fill=Species, color=Species)) + 
        geom_density(alpha=0.5) +
        # Colorblind safe color scale
        scale_fill_brewer(type="qual", palette=2, direction=1) +
        scale_x_discrete(name='Sepal Lengths') +
        scale_y_continuous(name='Frequency')

spw <- ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) + 
        geom_density(alpha=0.5) +
        # Colorblind safe color scale
        scale_fill_brewer(type="qual", palette=2, direction=1) +
        scale_x_discrete(name='Sepal Widths')+
        scale_y_continuous(name='Frequency')

ptl <- ggplot(iris, aes(x=Petal.Length, fill=Species, color=Species)) + 
        geom_density(alpha=0.5) +
        # Colorblind safe color scale
        scale_fill_brewer(type="qual", palette=2, direction=1) +
        scale_x_discrete(name='Petal Lengths')+
        scale_y_continuous(name='Frequency')

ptw <- ggplot(iris, aes(x=Petal.Width, fill=Species, color=Species)) + 
        geom_density(alpha=0.5) +
        # Colorblind safe color scale
        scale_fill_brewer(type="qual", palette=2, direction=1) +
        scale_x_discrete(name='Petal Widths')+
        scale_y_continuous(name='Frequency')
# Draw plots in a 2x2 grid using cowplot
# The plots are labeled A to D
cowplot::plot_grid(spl, spw, ptl, ptw, labels='AUTO')
