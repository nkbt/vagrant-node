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

1. Install [Vagrant](http://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/)
2. Add Ubuntu 12.04 i386 box:

        vagrant box add precise32 http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-i386-vagrant-disk1.box

3. Add salt plugin:

        vagrant plugin install vagrant-salt

4. Checkout project:

        git clone git://github.com/nkbt/xo.git xo
        cd xo
        
5. You may want to edit `package.json`, add or remove some packages, change application name, etc

6. Run vagrant:
        
        vagrant up

7. Go to [http://localhost:10080](http://localhost:10080)
8. Use `vagrant ssh` to access sandbox. Or just connect with any SSH-client to `localhost:2222` using name `vagrant` and pass `vagrant`