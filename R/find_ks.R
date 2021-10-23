#' Finds matching keyboard shortcuts based on matched pattern on description
#'
#' @param pattern regular expression pattern applied on description to filter shortcuts of interest
#' @param ignore_case TRUE or FALSE to ignore case in regex pattern search, TRUE by default
#' @param windows_linux_include TRUE or FALSE to include column with windows/linux shortcuts, TRUE by default
#' @param mac_include TRUE or FALSE to include column with max shortcuts, TRUE by default
#' @param type_include TRUE or FALSE to include column with type info, TRUE by default
#' @param data shortcuts_table with tibble created based on RStudio Support page
#'
#' @return a tibble with matching observations
#' @export
#'
#' @examples
#' find_ks("zoom console")
#' find_ks("terminal", windows_linux_include = FALSE)
find_ks <- function(pattern, ignore_case = TRUE,
                    windows_linux_include = TRUE, mac_include = TRUE, type_include = TRUE,
                    data=shortcuts_table){

  filtered_table <- data %>%
    dplyr::filter( stringr::str_detect(`description`, stringr::regex(pattern, ignore_case = {ignore_case}))
            )

  if(windows_linux_include==FALSE){
    filtered_table <- filtered_table %>% dplyr::select(-windows_linux)
  }

  if(mac_include==FALSE){
    filtered_table <- filtered_table %>% dplyr::select(-mac)
  }

  if(type_include==FALSE){
    filtered_table <- filtered_table %>% dplyr::select(-type)
  }
  return(filtered_table)

}
