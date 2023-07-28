# Terraform-GCP

# Arquitetura de Criação de Duas Máquinas e Load Balancer na Google Cloud

## Passo 1: Criação das Máquinas Virtuais

1. Acesse o [Google Cloud Console](https://console.cloud.google.com) e faça login na sua conta.
2. No painel de controle, clique no menu de navegação e selecione "Compute Engine" > "VM Instances".
3. Clique no botão "Create Instance" para criar uma nova VM.
4. Preencha os detalhes da VM, como nome da instância, região, zona, tipo de máquina e sistema operacional. Repita este passo para criar a segunda VM.
5. Aguarde a criação das VMs. Agora você possui duas máquinas virtuais prontas para serem configuradas.

## Passo 2: Configuração das Máquinas Virtuais

1. Selecione uma das VMs criadas e clique no botão "SSH" para acessar a máquina por linha de comando.
2. Execute os comandos necessários para instalar e configurar os serviços e aplicativos que sua aplicação requer.
3. Repita o processo acima para configurar a segunda VM, certificando-se de manter a mesma configuração em ambas para garantir a uniformidade.

## Passo 3: Configuração do Balanceador de Carga

1. No painel de controle do Google Cloud Console, clique no menu de navegação e selecione "Network Services" > "Load Balancing".
2. Clique no botão "Create a load balancer" para começar a configuração.
3. Escolha o tipo de balanceador de carga "HTTP(S) Load Balancing" para distribuir o tráfego HTTP/HTTPS entre as VMs.
4. Configure o Frontend do balanceador, definindo o endereço IP, portas e protocolos.
5. No Backend, adicione as duas VMs criadas anteriormente, definindo as portas e protocolos correspondentes.
6. Realize as configurações adicionais necessárias e revise as informações do balanceador de carga antes de criar.
7. Clique no botão "Create" para criar o balanceador de carga.

## Passo 4: Testando o Balanceador de Carga

1. Após a criação do balanceador de carga, ele estará pronto para distribuir o tráfego entre as duas VMs.
2. Acesse o endereço IP do balanceador de carga pelo navegador para verificar se o tráfego está sendo distribuído corretamente entre as VMs.

## Considerações Finais

Parabéns! Você criou uma arquitetura eficiente com duas máquinas virtuais e um balanceador de carga na Google Cloud. Isso permitirá que sua aplicação tenha alta disponibilidade e escalabilidade, garantindo que o tráfego seja distribuído de forma equilibrada entre as VMs.

Lembre-se de monitorar o desempenho das VMs e o tráfego no balanceador de carga para fazer ajustes conforme necessário. Além disso, explore outras funcionalidades da Google Cloud para otimizar ainda mais sua infraestrutura e atender às necessidades específicas da sua aplicação.

Para mais informações e detalhes adicionais, consulte a [documentação oficial do Google Cloud](https://cloud.google.com/docs).


Para mais informações e detalhes adicionais, consulte a documentação oficial do Google Cloud.
