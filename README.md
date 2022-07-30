# GCP-Final-Project

## build an image for the application then push it to GCR

![alt](./GCP-Final-Project%20e0c575796b77428d9a2a6d72509b8c27/14fd19c9-b0cf-49f9-aaf1-ab13000d90f1.png)

```bash
gcloud auth configure-docker gcr.io
docker tag  pythredimg gcr.io/salma-88782/pythredimg
docker push gcr.io/salma-88782/pythredimg
docker tag redis gcr.io/salma-88782/pythredimg
docker push gcr.io/salma-88782/pythredimg
```

## provision infrastructure using terraform

One VPC with two private subnets 

Management subnet
- nat and route to acess it to the internet
-Private VM (bastion) to access  GKE cluster

-firewall to allow ssh
2. Restricted subnet 
• Private standard GKE cluster (private control plan)

## authenticate service account

```bash
gcloud auth activate-service-account   gcpproject@salma-88782.iam.gserviceaccount.com --project=salma-88782 --key-file="salma-88782-63595c5e2f38.json"
export GOOGLE_APPLICATION_CREDENTIALS="salma-88782-63595c5e2f38.json"
```
Provisioning
```bash
terraform init
terraform plan --var-file infra.tfvars
terraform apply --var-file infra.tfvars
```

![Screenshot from 2022-07-30 04-48-12.png](GCP-Final-Project%20e0c575796b77428d9a2a6d72509b8c27/Screenshot_from_2022-07-30_04-48-12.png)

![Screenshot from 2022-07-29 22-49-43.png](GCP-Final-Project%20e0c575796b77428d9a2a6d72509b8c27/Screenshot_from_2022-07-29_22-49-43.png)

## Install kubctl in vm instance

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
kubectl version --client --output=yaml
```

![Screenshot from 2022-07-29 22-54-52.png](GCP-Final-Project%20e0c575796b77428d9a2a6d72509b8c27/Screenshot_from_2022-07-29_22-54-52.png)

## Let’s deploy kubernetes yaml files

![Screenshot from 2022-07-30 04-49-05.png](GCP-Final-Project%20e0c575796b77428d9a2a6d72509b8c27/Screenshot_from_2022-07-30_04-49-05.png)

![Screenshot from 2022-07-30 04-49-20.png](GCP-Final-Project%20e0c575796b77428d9a2a6d72509b8c27/Screenshot_from_2022-07-30_04-49-20.png)
