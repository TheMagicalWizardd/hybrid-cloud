# docker_role

Deze zelfgemaakte Ansible-role installeert en configureert Docker op de Azure VM en de ESXi VM binnen de hybrid-cloud deployment.

## Doel

De role zorgt ervoor dat beide Linux hosts Docker-containers kunnen draaien. De Docker image zelf wordt niet op de hosts gebouwd. De image wordt door GitHub Actions gebouwd en naar GitHub Container Registry gepusht. Daarna haalt `ansible/site.yml` deze image op en start de container op beide hosts.

## Taken

Deze role voert de volgende taken uit:

- installeert de benodigde packages voor Docker
- configureert de Docker repository
- installeert Docker Engine
- start en enabled de Docker service
- maakt de hosts klaar voor containerdeployment

## Gebruik

De role wordt gebruikt in `ansible/site.yml`:

```yaml
roles:
  - docker_role
## Vereisten

De benodigde Ansible collections staan in:

ansible/requirements.yml

Installeer deze met:

ansible-galaxy collection install -r ansible/requirements.yml

## Onderdeel van de opdracht

Deze role wordt uitgevoerd op beide omgevingen:

- Azure VM
- ESXi VM

Hiermee wordt voldaan aan de eis dat Docker via een zelfgemaakte Ansible Galaxy-style role wordt geïnstalleerd.
