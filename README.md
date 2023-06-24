# ansible-terra-gke
## step 1: create-autopilot-gke.yml
In order to create an autopilot cluster on gke, we have to run following commands,  
```
ansible-playbook -i inventory.ini create-autopilot-gke.yml --ask-become-pass
```

## step 2: install_istio_jaeger.yml
In order to install jaegar and istio in above cluster, we have to run following commands,  
```
gcloud container clusters get-credentials autopilot-gui --region us-central1 --project pg-bull-run  
kubectl config use-context gke_pg-bull-run_us-central1_autopilot-gui  
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