print(getwd())
check_results <- devtools::check()

print(check_results)

if (length(check_results$errors) + length(check_results$warnings) + length(check_results$notes) >= 1) {
    stop('error, warning or note found')
}
