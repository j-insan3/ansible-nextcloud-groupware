Playbook for deploying complete Nextcloud 'groupware' stack on CentOS 7
==============


Requirements
-------------------------------------------

- Ansible 2.2 >
- CentOS 7 installation ( LDAP server(s) can be a FreeNAS jail also...)
- SSH access to the servers
- Setup all the dns records and ports in advance ( or letsencrypt will fail )
- Nextcloud and Roundcube can be on CentOS 8, but no z-push NOT

How to use
-------------------------------------------

Deploying whole stack:
------------------

Copy the hosts.example.yml to hosts.yml and fill in all the variables and host information. (Or create your own setup another way. You can use this example as reference of all the vars.)
After filling in all the things you need start a deployment:

Also make sure you set all the dns records and portforwards/firewalls correctly, otherwise letsencrypt will fail.

    ansible-playbook deploy.yml -i hosts.yml

Certificates for dovecot / postfix:
------------------
Put the certificates in the files folder. You need a valid certificate, i did not implement letsencrypt for postfix/dovecot for a few reasons:
- It became a bit complex since i also use DANE for my mailservers.
- I don't have DNS provider who has an api for letsencrypt at this moment.
- DV certs a cheap, less then 10 dollar for a year.
- and some more forgot at this moment.


Post install
------------------
After deployment you can reach the following pages for managemnt:
phpldapadmin: http://ldap1.example.loc:8080/phpldapadmin/
rspamd webinterface: http://mta1.example.loc:8080/rspamd/
solr interface: http://mta1.example.loc:8983/solr/

the credentials are set in the vars

the urls for nextcloud, roundcube and zpush are set in the vars.



Update solr:
------------------
If solr has an update you can update this way. Change the version number in hosts file ( or if you moved the vars somewhere else, change it there)

    ansible-playbook deploy.yml -i hosts.yml --tags solr


Update Roundcube :
------------------
If roundcube has an update, change the var to the new version. then run

    ansible-playbook upgrade-roundcube.yml -i hosts.yml

Additional tags:
- letsencrypt
- php


.
