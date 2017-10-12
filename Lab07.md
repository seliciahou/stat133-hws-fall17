Lab07
================

R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

``` r
f <- function(x) {
  x^2
  }
f(2)
```

    ## [1] 4

``` r
f(-5)
```

    ## [1] 25

``` r
g <- function(x) {
  2*x + 5
}
g(0)
```

    ## [1] 5

``` r
g(-5/2)
```

    ## [1] 0

``` r
fog <- function(x) {
  (2*x+5)^2
  }
fog(2)
```

    ## [1] 81

``` r
fog(-5)
```

    ## [1] 25

``` r
gof <- function(x) {
  2*(x^2)+5
}
gof(0)
```

    ## [1] 5

``` r
gof(-5/2)
```

    ## [1] 17.5

``` r
pythagoras <- function(a, b) {
  sqrt(a^2 + b^2)
}
pythagoras(3, 4)
```

    ## [1] 5

``` r
miles2kms <- function(x=1) {
  1.6*x
}
miles2kms()
```

    ## [1] 1.6
