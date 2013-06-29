screen:
  pkg:
    - installed

git:
  pkg:
    - installed

redis-server:
  pkg:
    - installed

nodejs:
  pkg:
    - installed
    - require:
       - cmd: nodejs-ppa

nodejs-ppa:
  cmd.run:
    - name: "add-apt-repository -y ppa:chris-lea/node.js && apt-get update"
    - unless: "[ -f /etc/apt/sources.list.d/chris-lea-node_js-{{ grains['oscodename'] }}.list ]"

supervisor:
  npm:
    - installed
    - require:
      - pkg: nodejs
      - pkg: git

#
#
#
#
#
# Application setup and run
#

app-install:
  cmd.run:
    - name: npm install
    - cwd: /vagrant/
    - require:
      - pkg: nodejs
      - pkg: git
      
app-run:
  cmd.run:
    - name: screen -dmS newscreen nohup npm start
    - cwd: /vagrant/
    - unless: "pgrep npm"
    - require:
      - pkg: nodejs
      - pkg: screen
      - pkg: redis-server
      - npm: supervisor
      - cmd: app-install