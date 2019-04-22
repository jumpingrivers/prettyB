## Test environments
- local x86_64-pc-linux-gnu install, R 3.5.3
- R-hub ubuntu-gcc-release (r-release)
- R-hub windows-x86_64-devel (r-devel)
- R-hub fedora-clang-devel (r-devel)
- win-builder (all versions)
- travis-ci (all versions)


## R CMD check results

0 errors | 1 warnings | 1 note

 * Note: New submission
 * Warnings: S3 registeration of qqnorm.default. This package
 provides new versions of base graphics by over riding the defaults. qqnorm.default isn't 
 exported by stats, so I had to use :::

## Release summary

 * First version
