# Postgres Master-Slave replication with PgPool II

Add vault password to `.vault_pass`.

Run command:
```bash
ansible-playbook -i inventories/database.ini --vault-password-file=.vault_pass database.yml
```