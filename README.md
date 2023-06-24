# ansible-terra-gke

Update your vars in ansible.vars.yml file,  
and you need to have service-account secrets json key in your terraform and root directory.
```
project_id: crewnetics-dev
credential: crewnetics-dev-352099b311f4.json
region_name: us-central1
environment: test
autopilot: true
```
## step 1: create-autopilot-gke.yml
In order to create an autopilot cluster on gke, we have to run following commands,  
```
ansible-playbook -i inventory.ini create-autopilot-gke.yml --ask-become-pass
```

## step 2: install_istio_jaeger.yml
In order to install jaegar and istio in above cluster, we have to run following commands,  
```
gcloud config set core/project crewnetics-dev
gcloud container clusters get-credentials test --region us-central1 --project crewnetics-dev
kubectl config use-context gke_crewnetics-dev_us-central1_test  

ansible-playbook -i istio_inventory.ini install_istio_jaeger.yml --ask-become-pass
```
## step 3: delete-autopilot-gke.yml
In order to delete an autopilot cluster in gke and its resources, we have to run following commands,  
```
ansible-playbook -i inventory.ini delete-autopilot-gke.yml --ask-become-pass
```

### other commands:
```
ansible-galaxy collection install community.kubernetes
```