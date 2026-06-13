# Hybrid Cloud Deployment

## Beschrijving

Dit project bouwt een hybrid cloud omgeving met een Azure VM en een ESXi VM. De infrastructuur wordt aangemaakt met Terraform. Daarna configureert Ansible beide machines. Op beide systemen wordt een gebruiker `testuser` aangemaakt, Docker geïnstalleerd via een eigen Ansible role en een Hello World container gestart.

De Docker image wordt gebouwd via GitHub Actions en gepubliceerd naar GitHub Container Registry. Ansible gebruikt daarna deze CI-gebouwde image op zowel Azure als ESXi.

## Architectuur

```text
GitHub repository
   |
   | push
   v
GitHub Actions self-hosted runner
   |
   | build Docker image
   v
GitHub Container Registry
   |
   | Ansible pull
   v
Azure VM + ESXi VM
