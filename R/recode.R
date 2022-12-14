
# Recode cases to the target where the condition is met

recode <- function(dat, var_list, target, condition = "TRUE") {

  check_var_validity(dat, var_list)

  targ_val <- determine_var(dat, target)[1]

  bools <- eval_expr(dat, condition)

  for(i in 1:length(var_list)) {

    dat[bools==TRUE, var_list[i]] <- targ_val[bools==TRUE,]
  }

  if(condition == "TRUE") {

    cat("All cases in", var_list, "recoded to the target. \n")

  } else {

    cat("All cases in", var_list, "recoded to the target where", condition, "is true. \n")
  }

  return(dat)
}
