# Explanation of create_g1k_ref.sh

This script file is used to create a reference panel named "`g1k`", which is used for WEScall (a genotyping calling tool for whole exome sequencing data).

Here are the main steps of the code:

1. Set some environment variables, including the directory of the current script (`DIR`) and `g1k_path` (the path of 1000G phase 3 data input by the user).

2. Check if the reference panel already exists. If it does, the script will prompt the user to delete the existing reference panel and rerun the script.

3. If the reference panel does not exist, the script will create a new directory to store the reference panel.

4. Prompt the user to enter the path of the 1000G phase 3 data. If the entered path does not exist, the script will continue to prompt the user to enter.

5. Define two functions `filter_autosome` and `filter_X_chr`, these two functions are used to handle different chromosome data. These functions use bcftools (a tool for handling VCF/BCF files in bioinformatics) to process and filter data.

6. Check if the `parallel` tool is installed. If it is, the script will process the data in parallel, otherwise it will process the data sequentially.

7. Finally, the script will create a file named `all_done.OK`, indicating that the reference panel has been successfully created.

This script is mainly used for genotyping calling in bioinformatics, especially when dealing with whole exome sequencing data.
