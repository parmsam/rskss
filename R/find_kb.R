#' Finds shortcuts based on matched pattern on windows/linux keybindings.
#'
#' @param pattern regular expression pattern applied on key bindings to filter shortcuts of interest
#' @param ignore_case TRUE or FALSE to ignore case in regex pattern search, TRUE by default
#' @param data shortcuts_table with tibble created based on RStudio Support page
#'
#' @return a tibble with matching observations
#' @export
#'
#' @examples
#' find_kb_winlin("Ctrl+1")
find_kb_winlin <- function(pattern, ignore_case = TRUE,
                           data=shortcuts_table){
  filtered_table <- {{data}} %>%
    dplyr::select(.data$description, .data$windows_linux, .data$type) %>%
    dplyr::filter( stringr::str_detect(.data$`windows_linux`, stringr::fixed(pattern, ignore_case = {ignore_case})))

  return(filtered_table)
}

#' Finds shortcuts based on matched pattern on mac keybindings.
#'
#' @param pattern regular expression pattern applied on key bindings to filter shortcuts of interest
#' @param ignore_case TRUE or FALSE to ignore case in regex pattern search, TRUE by default
#' @param data shortcuts_table with tibble created based on RStudio Support page
#'
#' @return a tibble with matching observations
#' @export
#'
#' @examples
#' find_kb_mac("Ctrl+1")
find_kb_mac <- function(pattern, ignore_case = TRUE,
                        data=shortcuts_table){
  filtered_table <- {{data}} %>%
    dplyr::select(.data$description, .data$mac, .data$type) %>%
    dplyr::filter( stringr::str_detect(.data$`mac`, stringr::fixed(pattern, ignore_case = {ignore_case})))

  return(filtered_table)
}
