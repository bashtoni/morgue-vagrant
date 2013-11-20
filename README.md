# Morgue Vagrant

A quick repo to build a Vagrant box which runs
[morgue](https://github.com/etsy/morgue).

Assumes you have the following excellent Vagrant plugins installed:

[vagrant-lxc](https://github.com/fgrehm/vagrant-lxc)
[vagrant-hostmanager](https://github.com/smdahlen/vagrant-hostmanager)

You should be able to run with VirtualBox by just modifying the box name
in the Vagrantfile.

To use, run [librarian-puppet](https://github.com/rodjek/librarian-puppet) 
inside the `puppet/` directory and then `vagrant up --provider=lxc`.

Once the machine is up, import the database by running
`/vagrant/populate-db.sh`
