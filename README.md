# stark-challenge
Repositório criado para armazenar toda a evolução e raciocínio durante o desafio proposto.


### Inicio do Desafio

Desafio iniciado no dia 06/10/24 às 00:19

![init](https://github.com/user-attachments/assets/7997ecc3-e6e1-4247-a776-cc4f15467f2f)


### Desenho da arquitetura do projeto

![Sem título-2024-07-15-2121_compressed](https://github.com/user-attachments/assets/570ea931-f2fb-4a95-83c4-c07302454ef2)


### Issues criada para cada microserviço.

- [ ] https://github.com/stark-ubuntu/invoice-backend/issues
- [ ] https://github.com/stark-ubuntu/credit-backend/issues
- [ ] https://github.com/stark-ubuntu/transfer-backend
- [ ] https://github.com/stark-ubuntu/devops-backend
- [ ] https://github.com/stark-ubuntu/streaming-transfer-pyspark
- [ ] https://github.com/stark-ubuntu/batch-invoice-enrichment-pyspark

> Depois de idealizar, estruturar e taskear o projeto, chegou a hora de descansar um pouco para colocar a mão na massa já já! Horário de pausa 02:25  

### Trabalho retomado - 07/10 às 14:00

Inicianda analise do ambiente Stark e acessando o Dash.

> Bug ou má experiencia -> Quando fui criar meu acesso na Stark Bank, após finalizar todos os passos (ultimo mostrado, baixar o Stark Auth e scannear o QRCode). Sou redirecionado para novamente para o link do invite ou invés do Dashboard já logado. Precisei apagar a url /invite adiante.

Adiantei bastante coisa com relação a configuração do ambiente, conexão com a Stark etc. Amanha continuarei e pretendendo finalizar antes das 12h
 - Compose banco de dados, com registro de clientes fictícios, criando schemas, usuario do debezium, etc...
 - busca aleatorio dos clientes
 - cron de 3h em 3h até 24h
 - conexão com a stark (consegui chamar o Balance.get())
 - debezium monitorando corretamente a tabela
 - debezium escrevendo no topico corretamente
 - teste codados para invoice-backend

### Trabalho retomado - 08/10 às 09:20
Concluido invoices-backend -> https://github.com/stark-ubuntu/invoice-backend/issues?q=is%3Aissue+is%3Aclosed
