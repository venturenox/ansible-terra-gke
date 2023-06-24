Please note that this playbook assumes you have already authenticated and configured the GKE cluster on your machine using tools like gcloud or kubectl.
and have installed ansible and terraform in your local machine.
still in order to install ansible and terraform use following commands

ansible-playbook -i inventory.ini create-autopilot-gke.yml --ask-become-pass

ansible-playbook -i istio_inventory.ini install_istio.yml --ask-become-pass


gcloud container clusters get-credentials autopilot-gui --region us-central1 --project pg-bull-run
kubectl config use-context gke_pg-bull-run_us-central1_autopilot-gui

ansible-galaxy collection install community.kubernetes