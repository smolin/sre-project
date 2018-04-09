# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "logstash" do |logstash|
    logstash.vm.hostname = "logstash"
    logstash.vm.box = "debian/stretch64"
    logstash.vm.network "private_network", ip: "172.16.0.101"
    logstash.vm.network "forwarded_port", guest: 5044, host: 5044
    logstash.vm.network "forwarded_port", guest: 9600, host: 9600
    logstash.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/playbook.yml"
      ansible.groups = {
        "dev" => [ "logstash" ]
      }
    end
  end

  config.vm.define "elasticsearch" do |elasticsearch|
    elasticsearch.vm.hostname = "elasticsearch"
    elasticsearch.vm.box = "debian/stretch64"
    elasticsearch.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
    end
    elasticsearch.vm.network "private_network", ip: "172.16.0.102"
    elasticsearch.vm.network "forwarded_port", guest: 9200, host: 9200
    elasticsearch.vm.network "forwarded_port", guest: 9300, host: 9300
    elasticsearch.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/playbook.yml"
      ansible.groups = {
        "dev" => [ "elasticsearch" ]
      }
    end
  end

  config.vm.define "kibana" do |kibana|
    kibana.vm.hostname = "kibana"
    kibana.vm.box = "debian/stretch64"
    kibana.vm.network "private_network", ip: "172.16.0.103"
    kibana.vm.network "forwarded_port", guest: 443, host: 443
    kibana.vm.network "forwarded_port", guest: 5601, host: 5601
    kibana.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/playbook.yml"
      ansible.groups = {
        "dev" => [ "kibana" ]
      }
    end
  end

end
