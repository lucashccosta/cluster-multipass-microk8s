# k8s com multipass e microk8s
Criando um cluster kubernetes localmente. Ideal para testes e sandbox para desenvolvedores.

## Multipass
O Multipass é um sistema de VM (maquinas virtuais) que auxilia na criação e gestão de VM . Alem de facilicar a criação, ele tambem expõe cada maquina em um IP publico e é ideal para realizarmos testes no cluster e expor publicamente os nossos serviços.

## Microk8s
O microk8s é uma implementação pequena e leve do kubernetes. Ele possui certificação oficial e contem todas funcionalidades. É ideal para testes e ambientes de desenvolvimento.

## kubectl
O kubectl é um utilitário de linha de comando que permite rodar comandos no seu cluster kubernetes. Com ele será possivel fazer deploys, gerenciar recursos e visualizar logs das aplicações. Faça a instalação padrão seguindo as orientações do fabricante.

## K9s
O K9s é um utilitário de linha de comando para gerenciar o cluster k8s. Faça instalação seguindo as orientações no github do K9s.

## Criando os nós do cluster
```
# Cria uma maquina virtual (VM) para ser o master do cluster k8s
./k8s-master.sh

# Crie as VMs para o node-1 e node-2
./k8s-node-1.sh
./k8s-node-2.sh

# Crie um token para o novo nó no cluster master
multipass exec k8s-master -- bash -c 'microk8s add-node'

# Pegue a saída do comando anterior e monte conforme o exemplo:
multipass exec k8s-node-1 -- bash -c 'microk8s join <dados do master>'
# Exemplo: multipass exec k8s-node-1 -- bash -c 'microk8s join 10.233.220.27:25000/806b4a9fca4fdec5621f89bd6c94c04c/6430b53ea4b3'

# repita este processo para o node-2
multipass exec k8s-node-2 -- bash -c 'microk8s join <dados do master>'
# Exemplo para node-2: multipass exec k8s-node-2 -- bash -c 'microk8s join 10.233.220.27:25000/806b4a9fca4fdec5621f89bd6c94c04c/6430b53ea4b3'

# Verique as VMs criadas
multipass list

# Verifique os nós do cluster
kubectl get nodes
```

OBS: O arquivo *k8s-cluster.sh* é um script com os passos de criação automático do cluster.