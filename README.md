# iac-terraform-digital-ocean

- Para utilizar o projeto crie na raiz o arquivo terraform.tfvars com as seguintes variáveis

```
do_token=
k8s_name=
region=
```

-- O token pode ser obtido na opção API da sua conta da Digital Ocean
-- k8s_name é o nome que você vai atribuir para ser exibido como nome do cluster na Digital Ocean
-- region é a região onde você está usando seus recursos na Digital Ocean

- Para executar, basta entrar no diretório raiz e executar

```
terraform init
terraform apply
yes
```

## Documentação de Referência

- [Documentação provider Digital Ocean](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs)
- [Documentação Local Provider](https://registry.terraform.io/providers/hashicorp/local/latest/docs)
- Instalação Terraform:  https://www.terraform.io/downloads
