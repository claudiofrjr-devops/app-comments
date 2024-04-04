
### Desenvolvimento do LAB

**Validação da aplicação**

> Realizar a conteinerização  da Aplicação
> 
> 1. Efetuado a criação do arquivo Dockerfile dentro do diretorio **app**  para criar a imagem da aplicação
>     - [ ]  Utilizando a imagem BASE "alpine" para construção da imagem 
>    - [ ]  Adicionado aos comandos de inicialização o "bind" para **0.0.0.0:8000**, essa adição foi devido ao comandos para testar o funcionamento da aplicação ocorriam somente internos no container 
>      
**Buildando a Imagem**
>    ```bash
>    docker build -t <nome_da_imagem> .     
> ``` 
  Obs: o ponto **( . )** ao final do comando se refere a copiar todo o diretorio para dentro da imagem
>          
- Apos a criação da imagem executar o container para efetuar testes
    
    ```bash
    docker run -dti -p 8000:8000 --name <nome_do_container> <nome_da_imagem_buildada>
    ```
    
    ---

**Iniciando Estrutura pata Terraformar Recursos**

