# Local dev setup

Personal dev automation setup.

## Important
**If you desire to use the same config you need to replace the ssh files under the `files` directory and encrypt them with ansible** 

## How to use it

1. Export your machine password to a temp file

```sh
echo "YOUR PASSWORD" > .become_pass
```

2. Export your vault pass to a temp file

```sh
echo "YOUR VAULT PASSWORD" > .vault_pass
```

3. Run ansible

> Remeber to replace <YOUR OS> with your current Operating system:
> Supported systems:
    - ubuntu
    - arch
    - macos

```sh
ansible-playbook main.yaml --vault-password-file=.vault_pass --become-password-file=.become_pass --tags <YOUR OS>
```

> Example:
    Install on Arch linux
    ```
ansible-playbook main.yaml --vault-password-file=.vault_pass --become-password-file=.become_pass --tags arch
    ```

## Docker config on linux

After installing docker, you still need to start and enable the service. Run the following command for that

```sh
sudo systemctl start docker.service
sudo systemctl enable docker.service
```

To avoid having to use docker with sudo, run the following commands:

```sh
sudo usermod -aG docker $USER
newgrp docker
```
