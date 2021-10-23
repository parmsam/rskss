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
## look at shortcuts table
dplyr::glimpse(rskss::shortcuts_table)
#> Rows: 201
#> Columns: 4
#> $ description   <chr> "Move cursor to Console", "Clear console", "Move cursor to beginning of line", "Move cursor…
#> $ windows_linux <chr> "Ctrl+2", "Ctrl+L", "Home", "End", "Up/Down", "Ctrl+Up", "Esc", "Ctrl+Shift+H", "Ctrl+. [pe…
#> $ mac           <chr> "Ctrl+2", "Ctrl+L", "Cmd+Left", "Cmd+Right", "Up/Down", "Cmd+Up", "Esc", "Ctrl+Shift+H", "C…
#> $ type          <chr> "Console", "Console", "Console", "Console", "Console", "Console", "Console", "Console", "So…
head(shortcuts_table, 5)
#> # A tibble: 5 x 4
#>   description                      windows_linux mac       type   
#>   <chr>                            <chr>         <chr>     <chr>  
#> 1 Move cursor to Console           Ctrl+2        Ctrl+2    Console
#> 2 Clear console                    Ctrl+L        Ctrl+L    Console
#> 3 Move cursor to beginning of line Home          Cmd+Left  Console
#> 4 Move cursor to end of line       End           Cmd+Right Console
#> 5 Navigate command history         Up/Down       Up/Down   Console
```

There is a function called find_ks() that allow you to filter the description field based on patterns of interest to quickly find the shortcut(s) of interest:

```r
## search on shortcut table description field
find_ks("zoom console")
#> # A tibble: 1 x 4
#>   description  windows_linux mac          type 
#>   <chr>        <chr>         <chr>        <chr>
#> 1 Zoom Console Ctrl+Shift+2  Ctrl+Shift+2 Views
find_ks("terminal", windows_linux_include = FALSE)
#> # A tibble: 6 x 3
#>   description                             mac               type    
#>   <chr>                                   <chr>             <chr>   
#> 1 Send current line/selection to terminal Cmd+Option+Return Source  
#> 2 Move focus to Terminal                  Shift+Option+M    Views   
#> 3 New Terminal                            Shift+Option+R    Terminal
#> 4 Move Focus to Terminal                  Shift+Option+M    Terminal
#> 5 Previous Terminal                       Shift+Option+F11  Terminal
#> 6 Next Terminal                           Shift+Option+F12  Terminal
```

