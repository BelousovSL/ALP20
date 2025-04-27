Vagrant.configure("2") do |config|
    config.vm.define "pxeserverbelousov" do |server|
        server.vm.box = 'ubuntu/22.04'
        server.vm.host_name = 'pxeserverbelousov'
        server.vm.network "forwarded_port", guest: 80, host: 8080
        server.vm.network :private_network, ip: "10.0.0.20", virtualbox__intnet: 'pxenet'
        server.vm.network :private_network, ip: "192.168.56.10", adapter: 3        
        server.vm.provider "virtualbox" do |vb|
            vb.memory = 1024
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        end
    
    server.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/provision.yml"
    ansible.inventory_path = "ansible/hosts"
    ansible.host_key_checking = "false"
    ansible.limit = "all"
    end
    end      
end
    