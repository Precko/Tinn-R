#------------------------------------------------------------------------
# This script runs always when Tinn-R identifies an R instance.
# Aim:
# - Set automatically some options related to R
# - Obtaining essential information regarding of R and TinnRcom package.
#------------------------------------------------------------------------
# Please, do not change if you do not know what you're doing!
# J.C.Faria - Tinn-R Team
# 31/01/2014 19:40:38
#------------------------------------------------------------------------

# Set repos: Rterm does not always shows the dialog to choose the repository
options('repos'='%repos')

# Necessary to package "debug" under Rterm interface
options(debug.catfile="stdout")

# Tinn-R/tmp/R_info.txt
tr_info <- paste(Sys.getenv('APPDATA'),
                 'Tinn-R',
                 'tmp',
                 'Rinfo.txt',
                 sep='\\')

# R path
r_home <- R.home('bin')

# TinnRcom path
trc_path <- try(find.package('TinnRcom'),
                silent=TRUE)

if(!file.exists(trc_path))
{
  trc_path    <- 'Not installed!'
  trc_version <- 'x.x-x   :('
} else
  trc_version <- try(packageVersion('TinnRcom'),
                     silent=TRUE)

sink(tr_info)
  # Write to a connection
  cat(r_home,
      trc_path,
      as.character(trc_version),
      .libPaths(),
      fill=1)
sink()

# Remove objects
rm(tr_info,
   r_home,
   trc_path,
   trc_version)
