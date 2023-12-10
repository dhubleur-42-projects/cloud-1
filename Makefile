PLAYBOOK_BASE_COMMAND=ansible-playbook site.yml -i hosts -u root

up:
	$(PLAYBOOK_BASE_COMMAND) --tags docker,app

docker:
	$(PLAYBOOK_BASE_COMMAND) --tags docker

app:
	$(PLAYBOOK_BASE_COMMAND) --tags app

reset:
	$(PLAYBOOK_BASE_COMMAND) --tags reset

clean:
	$(PLAYBOOK_BASE_COMMAND) --tags clean

stop:
	$(PLAYBOOK_BASE_COMMAND) --tags stop

re: clean
	make up