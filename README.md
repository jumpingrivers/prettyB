
<!-- README.md is generated from README.Rmd. Please edit that file -->
Prettified Base Graphics
------------------------

Load the package and get

``` r
## Masks a lot of base functions
library("prettyB")
```

Compare

``` r
par(mfrow=c(1, 2))
graphics::plot.default(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Sepal.Length, iris$Sepal.Width)
```

<img src="graphics/README-unnamed-chunk-3-1.png" style="display: block; margin: auto;" />

Also have different themes:

``` r
theme_set("minimal")
plot(iris$Sepal.Length, iris$Sepal.Width, main="Classic Iris Dataset", 
     xlab="Length", ylab="Width")
```

<img src="graphics/README-unnamed-chunk-4-1.png" style="display: block; margin: auto;" />

Other plots
-----------

The package also prettifies

-   barplots

    ``` r
    barplot(table(iris$Species))
    ```

    <img src="graphics/README-unnamed-chunk-5-1.png" style="display: block; margin: auto;" />
-   qqplots

    ``` r
    qqnorm(rnorm(10))
    ```

    <img src="graphics/README-unnamed-chunk-6-1.png" style="display: block; margin: auto;" />

TODO
----

-   Think a bit more about palettes
-   Boxplots
-   Histograms
    -   Change default colour
    -   Change default method to Scott
-   Bug fix: When the package builds, Rplots.pdf is generated!
