# profile_memtest

![pdk-validate](https://github.com/ncsa/puppet-profile_memtest/workflows/pdk-validate/badge.svg)
![yamllint](https://github.com/ncsa/puppet-profile_memtest/workflows/yamllint/badge.svg)

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with profile_memtest](#setup)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Dependencies](#dependencies)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This puppet profile creates scripts to run STREAM for performance testing (memory) on compute nodes

It does not install STREAM. 

## Setup

Include profile_memtest	in a puppet profile file.
```
include ::profile_memtest
```

## Usage

Setup a desired performance table using `profile_memtest::performance_table` (multi-line string).
The 1st column contains regex to match the host running the script.
The 2nd column contains expected / desired STREAM Triad performance.
Additional columns may be added if you want to run the script on multiple cores (NUMA nodes). The format requires a new column for each core number you want to test on.
If `performance_table` is not defined, the script will error out.

Example
```yaml
profile_memtest::performance_table: |
  ^mg0([0-7]|8[0-4]) 13500 0 1
  ^mg08[5-8] 13000 0 16 32 48
  ^mgtest0[1-5] 15000
```

If STREAM is not located in the default installation path (/var/spool/slurmd/mom_priv/bin/stream), define `profile_memtest::stream_path`.

The profile will create two files in /root/scripts/
- `memtest_script` The executable that you can run
- `memtest_table`  The reference table for desired STREAM performances

A successful run will not display any output. Use the `-v` flag for verbose mode to display output to screen.

## Dependencies

This profile requires STREAM to be installed. 

## Reference

This section is deprecated. Instead, add reference information to your code as
Puppet Strings comments, and then use Strings to generate a REFERENCE.md in your
module. For details on how to add code comments and generate documentation with
Strings, see the [Puppet Strings documentation][2] and [style guide][3].

## Limitations

n/a

## Development

This Common Puppet Profile is managed by NCSA for internal usage.
