.PHONY: carton-install database

all: carton-install

carton-install:
	carton install --deployment

database:
	mysql -uroot < etc/schema.sql

test:
	carton exec -- prove t
