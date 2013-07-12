# vagrant-node
============

Bootstrap for Node.JS development.

### You get:

- Git
- Node (latest version, NPM included)
- Supervisor (Node runner, installed globally)
- Redis database
- Simple app.js that serves index.html
- Node app is run automatically with supervisor (watches for file changes)
- Node modules installed by default for app:
    - socket.io
    - async
    - underscore
    - redis

### Installation

1. Install [Vagrant](http://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/). *WARNING*: VirtualBox 4.2.14 [does not work](https://github.com/mitchellh/vagrant/issues/1850) with Vagrant, but previous version 4.2.12 and version 4.2.16 works fine - [fix was released on 5th July 2013](https://blogs.oracle.com/virtualization/entry/oracle_vm_virtualbox_4_26).
2. Add Ubuntu 12.04 i386 box:

        vagrant box add precise32 http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-i386-vagrant-disk1.box

3. Add salt plugin:

        vagrant plugin install vagrant-salt

4. Checkout project:

        git clone git://github.com/nkbt/vagrant-node.git vagrant-node
        cd vagrant-node
        
5. You may want to edit `package.json`, add or remove some packages, change application name, etc

6. Run vagrant:
        
        vagrant up

7. Go to [http://localhost:13000](http://localhost:13000) and open browser console to see messages from server 
8. Use `vagrant ssh` to access sandbox. Or just connect with any SSH-client to `localhost:2222` using name `vagrant` and pass `vagrant`
