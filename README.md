# Bento

## About this fork

This fork aims to create Vagrant boxes suitable for use by
[`travis-cookbooks`](https://github.com/travis-ci/travis-cookbooks).

**It is not supported by Travis CI team.**

### Usage

It is assumed that you have cloned `travis-cookbooks` to the same directory
as `bento`.

```
git clone https://github.com/travis-ci/travis-cookbooks.git
git clone https://github.com/BanzaiMan/bento.git
```

In the `packer` directory, run `./generate` script to generate JSON file
required to build the Vagrant box with Packer.

```
cd bento
./generate [14.04]
```

This will generate `packer/ubuntu-12.04-amd64-travis.json`.
Optionally, you can pass `14.04` to generate `packer/ubuntu-14.04-amd64-travis.json`.

You will use these Packer templates to generate Vagrant boxes.

Each template defines 3 builders, `virtualbox-iso`, `vmware-iso` and
`parallels-iso`.
Each builder is configured to use 2 GB of memory and 2 CPUs.
Unless you're on a very large system, use of `-parallel=false`
is recommended.

Furthermore, the ISO image should be in `iso/ubuntu/<release>` directory.

```
wget -O iso/ubuntu/12.04/ubuntu-12.04.5-server-amd64.iso http://releases.ubuntu.com/12.04.5/ubuntu-12.04.5-server-amd64.iso
cd packer
packer build -parallel=false [-only=vmware-iso] ubuntu-12.04-amd64-travis.json
```

After configuring the base system, the builder will provision
the box with the `standard` set of recipes in `travis-cookbooks`
which all Travis CI images have.

The default user is `travis`, and the password is `travis`.
(This is different from the usual Bento configureation, which
sets up the `ubuntu` user.)

While care is taken to emulate the real Travis CI images, the resulting
Vagrant boxes may not have the same characteristics in aspects such as:
available memory and disk space, file system type,
network configurations.

### Using the resulting Vagrant boxes

The resulting boxes in `builds` can then be used to boot a VM with
Vagrant.

See https://github.com/travis-ci/travis-cookbooks/blob/master/README.md#vagrant
for more details.