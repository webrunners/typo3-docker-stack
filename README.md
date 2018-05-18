TYPO3 CMS on docker
===================

## requirements
* docker
* docker-compose

### set up docker containers

```bash
./container/bin/run.sh
```

If you change any of the _*.Dockerfile_ tell docker to build an updated image

```bash
./container/bin/run.sh up -d --build
```

## web root

we use wwwroot as our webroot. Lets setup a fresh TYPO3 installation:

```bash
./container/bin/composer.sh init
./container/bin/composer.sh config extra.typo3/cms.cms-package-dir '{$vendor-dir}/typo3/cms'
./container/bin/composer.sh config extra.typo3/cms.web-dir 'wwwroot'
./container/bin/composer.sh require typo3/cms helhum/typo3-console
./container/bin/typo3cms.sh install:setup
./container/bin/typo3cms.sh install:fixfolderstructure
```

### endpoints

[access typo3 backend](http://localhost:8888/typo3/)  
[access typo3 frontend](http://localhost:8888)  
[access fake smtp server](http://localhost:8025)


# contributing

Want to help build this stack? Check the [contributing documentation](CONTRIBUTING.md)
