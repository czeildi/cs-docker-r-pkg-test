check_results <- devtools::check(vignettes = FALSE)

print(check_results)

if (length(check_results$errors) + length(check_results$warnings) + length(check_results$notes) >= 3) {
    stop('error, warning or note found')
}
