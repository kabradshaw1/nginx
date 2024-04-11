## Nginx

This service is for routing and setting up the network insdie of the container.  It's for taking messages that come into the ec2 instance from the https and routing / to the next server, that provides the client, and /graphql to the express server that is setup to handle the calls from the client.