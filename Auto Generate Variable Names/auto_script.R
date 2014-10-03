tracts = paste("c", rep(1:100), sep="")
aplha_lett = c("aa", "bb", "bb")

#delim can also be defined as "." or ""
genVarNames = function(roots, vars, delim="_"){
  n.roots = length(roots)
  n.vars = length(vars)
  tot.vars = n.roots*n.vars
  instances = seq(0,tot.vars, by=n.vars) + 1
  varnames = character(tot.vars)
  
  for (i in instances){
    range = (i+(n.vars-1))
    j = range/n.vars
    varnames[i:range]= paste(roots[j], delim, vars[1:n.vars], sep="")
  }
  varnames = varnames[-c((length(varnames)-(n.vars-1)):length(varnames))]
  return(varnames)
}

genVarNames(tracts, aplha_lett)
