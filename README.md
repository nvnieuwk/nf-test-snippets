# nf-test-snippets
A collection of snippets to use for nf-test assertions

Each test folder contains a snapshot where you can see the result of the test snippet.

## Pipeline tests

1. [Get all relative paths of the output directory without checking md5sums](tests/pipeline/relative_paths_outdir/main.nf.test)

## Process/workflow tests

1. [Output everything from the process/workflow without checking md5sum of the files - only check existence](tests/process/no_md5sum_exist/main.nf.test)
2. [Output everything from the process/workflow without checking md5sum of the files - check content (only plain text)](tests/process/no_md5sum_content/main.nf.test)