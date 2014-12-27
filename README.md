# Bento

## About this fork

This fork aims to create Vagrant boxes suitable for use by
[`travis-cookbooks`](https://github.com/travis-ci/travis-cookbooks).

**It is not supported by Travis CI team.**

### Usage

Inside the `packer` directory, there are files `*-travis.json`.
You can run the `packer build` command with those files, and you will end up with
the Vagrant boxes under the `builds` directory.

The template defines 3 builders, `virtualbox-iso`, `vmware-iso` and
`parallels-iso`.
Each builder is configured to use 2 GB of memory and 2 CPUs.
Unless you're on a very large system, use of `-parallel=false`
is recommended.

In addition, it is assumed that you have cloned `travis-cookbooks` to the same directory
as `bento`.

```
git clone https://github.com/travis-ci/travis-cookbooks.git
git clone https://github.com/BanzaiMan/bento.git
cd bento
wget -O iso/ubuntu/12.04/ubuntu-12.04.5-server-amd64.iso http://releases.ubuntu.com/12.04.5/ubuntu-12.04.5-server-amd64.iso
cd packer
packer build -parallel=false ubuntu-12.04-amd64-travis.json
```

After configuring the base system, the builder will provision
the box with the `standard` set of recipes in `travis-cookbooks`
which all Travis CI images have.

The default user is `travis`, and the password is `travis`.

While care is taken to emulate the real Travis CI images, the resulting
Vagrant boxes may not have the same characteristics in aspects such as:
available memory and disk space, file system type,
network configurations.

### Using the resulting Vagrant boxes

The resulting boxes in `builds` can then be used to boot a VM with
Vagrant.

See https://github.com/travis-ci/travis-cookbooks/blob/master/README.md#vagrant
for more details.