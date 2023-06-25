# ansible-terra-gke

Update your vars in ansible.vars.yml file,  
and you need to have service-account secrets json key in your terraform and root directory.
```
project_id: crewnetics-dev
credential: crewnetics-dev-352099b311f4.json
region_name: us-central1
cluster_name: test
autopilot: true
```
## step 1: create-autopilot-gke.yml
In order to create an autopilot cluster on gke, we have to run following commands,  
```
ansible-playbook create-autopilot-gke.yml
```

## step 2: install_istio_jaeger.yml
In order to install jaegar and istio in above cluster, we have to run following commands,  
```
ansible-playbook install_istio_jaeger.yml --ask-become-pass
```
## step 3: delete-autopilot-gke.yml
In order to delete an autopilot cluster in gke and its resources, we have to run following commands,  
```
ansible-playbook delete-autopilot-gke.yml --ask-become-pass
```

### other commands:
```
ansible-galaxy collection install community.kubernetes
```