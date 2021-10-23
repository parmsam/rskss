<!-- README.md is generated from README.Rmd. Please edit that file -->



# rskss
(WORK IN PROGRESS)
<!-- badges: start -->
<!-- badges: end -->

The rskss package allows for search on a table of default keyboard shortcuts in Windows/Linux/Mac and for the RStudio IDE.

## Installation

You can install the development version of rskss from [GitHub](https://github.com/) with:

``` r
devtools::install_github("parmsam/rskss")
```
## Example

The package uses a tibble named `shortcuts_table` that has a list of descriptions, windows/linux/mac shortcuts, and types of shortcuts:


```r
library(rskss)
#> Error in library(rskss): there is no package called 'rskss'
## look at shortcuts table
dplyr::glimpse(rskss::shortcuts_table)
#> Error in loadNamespace(name): there is no package called 'rskss'
head(shortcuts_table, 5)
#> Error in head(shortcuts_table, 5): object 'shortcuts_table' not found
```

There is a function called find_ks() that allow you to filter the description field based on patterns of interest to quickly find the shortcut(s) of interest:

```r
## search on shortcut table description field
find_ks("zoom console")
#> Error in find_ks("zoom console"): could not find function "find_ks"
find_ks("terminal", windows_linux_include = FALSE)
#> Error in find_ks("terminal", windows_linux_include = FALSE): could not find function "find_ks"
```

