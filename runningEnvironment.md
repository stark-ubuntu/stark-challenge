# Running the development environment 


## Requirements
- Docker + Docker Compose
- mvn
- git
- Java
- 16gb ram recommended

> _This document will not demonstrate how to install or configure the above tools or any others that may appear during your reading. There will always be a link to support._


## The start

To get started, let's demonstrate how the repositories are organized.
![Screenshot from 2024-10-09 03-24-44](https://github.com/user-attachments/assets/caeaedeb-53f0-411a-bc1e-5fa04a9221b7)

In the image above you can see all the projects that have been designed to complete this challenge. They are..:

Stark-challenge (__You are here!__) -> Repository created to store all the steps until the conclusion of the challenge, such as documentation.

Invoice-backend -> Java + Quarkus app, created as the initial processing gateway for the challenge. This App is responsible for creating the invoices and sending them to Stark Bank.

Credit-backend -> Java App + Quarkus, created to capture the webhook triggered by Stark Bank for invoice events, in this app we capture the event, return the 200 quickly to stark and call an async processing to assemble the transfer intentions in a kafka topic.

Transfer-backend -> Java + Quarkus app, created to read a kafka topic and create a transfer at Stark Bank.

Batch-invoice-enrichment-spark (In-progess) -> Batch designed to process on a daily basis all the records that have passed through the commented apps and generate a report ready for the business area to consume and make the best decisions.

Streaming-transfer-pyspark (In-progess) -> Streaming designed to process incoming information in real time and deliver the fastest possible data for analysis and decision-making.

Devops-backend (In-progess) -> Repository where all the logic for the CI/CD of quarkus projects will be stored.

## Motivation

Given the challenge, I structured the architecture with a very critical environment in mind, requiring performance and availability. Each app was structured to work independently, i.e. no app depends on the other.

I approached the problem with the following domains: Invoice, credit and transfer.

Invoice -> Here I consider everything related to the invoice. So people's information, invoice data, etc...

Credit -> Here I consider everything related to credit, i.e. invoice is just another means of credit, so this app is ready to scale to any type of credit (today being invoice or boleto).

Transfer -> Here I consider everything related to bank transfers. This app listens to a kafka topic that has a signature in this topic, so any app that knows the signature (schema) can produce an async message and the transfer will be made.


## How to run locally?

To run this challange locally, follow the steps below.
> For this step we will need git and docker installed ([How to install git?](https://git-scm.com/book/pt-br/v2/Come%C3%A7ando-Instalando-o-Git) & [How to install docker?](https://docs.docker.com/engine/install/))

1. Clone the repository [star-challenge](https://github.com/stark-ubuntu/stark-challenge)
2. In a terminal navigate to the postgresql/ folder of the repository you just cloned.
3. Run the command `docker compose up -d`. This will create the postgres container.
4. Still in the same terminal, return a folder level `cd ..`
5. Run the `docker compose up -d` command again. This will start 4 new containers (kafka and debezium).

At this point, your environment is almost ready to clone the app repositories into quarkus.

1. install [ngrok](https://dashboard.ngrok.com/get-started/setup/linux) which is a tool that will help us configure our webhook on Stark Bank.

## Shall we clone the apps?

1. Clone the repositories [invoice-backend](https://github.com/stark-ubuntu/invoice-backend), [credit-backend](https://github.com/stark-ubuntu/credit-backend), [transfer-backend](https://github.com/stark-ubuntu/transfer-backend)
2. Follow the [Stak Bank documentation](https://starkbank.com/docs/api#authentication) to generate the private and public keys that are required for everything to work properly.
3. Add the keys to the invoice-backend and transfer-backend projects
4. You'll notice that in all the projects, application.yml, our configuration file, contains the following snippet
> id: ${ID_ACCOUNT:0000000000}
This shows us that this file makes use of environment variables. And for quarkus, environment variables can be represented in a file at the root of the project (individually in each project). That said, adjust according to your environment.

Almost there....

## Let's start the Apps!

1. In the root of each project, run the command `mvn compile quarkus:dev`.
2. In a new terminal, run the command `ngrok http http://localhost:8090`.
This will open the ngrok terminal, compile the url (final ngrok-free.app)
3. Access your sandbox workspace.
4. Go to Integrations >> Webhooks
5. Click on `New webhook`.
6. Paste the url you copied and add `/credit` at the end.
It should look something like this.
![Captura de tela de 2024-10-09 04-07-33](https://github.com/user-attachments/assets/efec895d-fd1d-4698-8dec-55ccf98107b8)

Wonderful! Now I just have to wait for the magic of the cron that is programmed to run every 3 hours.



Link to the start section: [Link Text](#the-start).
Link to the eequirements section: [Link Text](#requirements).
Link to the motivation section: [Link Text](#motivation).
Link to the Shall we clone the apps? section: [Link Text](#shall-we-clone-the-apps).
Link to the How to run locally? section: [Link Text](#how-to-run-locally?).
Link to the Let's start the Apps! section: [Link Text](#letsstart-the-apps!).

