# profile_memtest

Welcome to your new module. A short overview of the generated parts can be found
in the [PDK documentation][1].

The README template below provides a starting point with details about what
information to include in your README.

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

Setup a desired performance table using `profile_memtest::performance_table`. The script will reference the first column as a regex to match the host, and the second column to the expected / desired STREAM Triad performance.

Define `profile_memtest::stream_path` if STREAM is not located in "/var/spool/slurmd/mom_priv/bin/stream"

The profile will create two files in /root/scripts/
- `memtest_script` This is the executable that you can run
- `memtest_table` This is what the executable will reference

A successful run will not create any output. Use -v flag for verbose mode (displays output to screen).

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

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel are
necessary or important to include here. Please use the `##` header.

[1]: https://puppet.com/docs/pdk/latest/pdk_generating_modules.html
[2]: https://puppet.com/docs/puppet/latest/puppet_strings.html
[3]: https://puppet.com/docs/puppet/latest/puppet_strings_style.html
