# 5 - Virtual Machine setup with CLI

Installation of OpenStack CLI: <https://docs.openstack.org/python-openstackclient/2023.1/>

Equivalent CLI command for creating the Virtual Machine of [step 2](./2-virtual-machine-setup.md):

```bash
vm_name=my-vm
key_name=my-key

openstack server create \
    --image "ubuntu-20.04" \
    --flavor "m1.small" \
    --key-name "${key_name}" \
    --network dslab-demo \
    --security-group default \
    ${vm_name}
```

## Validation

VM is put in `Running` state.

![running-vm](images/running-vm.png)
