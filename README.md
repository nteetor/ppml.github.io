# ppml website

> Important: development takes place on the `source` branch and only the built
> site files are pushed to `master`.

## Getting started with Jekyll

TBD

## Rebuilding the site

1. Check if you are on the `source` branch, `git branch`
1. If you are not on `source` --
   * and `source` *is not* listed, `git checkout --track origin/source`
   * and `source` *is* listed, `git checkout source`
1. Make changes 
1. Rebuild site, `jekyll build`
1. Add changed files, `git add --all`
1. Commit changes, `commit -m "[briefly describe your changes]"`
1. Push changes back to the remote `source`, `git push`
1. Push site subdirectory to `master` branch, `git subtree push --prefix _site/ origin master`
