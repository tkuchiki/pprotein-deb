# pprotein-deb

Unofficial deb package of the [pprotein](https://github.com/kaz/pprotein).

## Usage

### pprotein

This package includes [alp](https://github.com/tkuchiki/alp) and [slp](https://github.com/tkuchiki/slp)

```
$ curl -LO https://github.com/tkuchiki/pprotein-deb/releases/download/v1.2.4-1/pprotein_1.2.4-1_amd64.deb
$ sudo apt install ./pprotein_1.2.4-1_amd64.deb
$ sudo systemctl enable pprotein
$ sudo systemctl start pprotein
```

### pprotein-agent

```
$ curl -LO https://github.com/tkuchiki/pprotein-deb/releases/download/v1.2.4-1/pprotein-agent_1.2.4-1_amd64.deb
$ sudo apt install ./pprotein-agent_1.2.4-1_amd64.deb
$ sudo systemctl enable pprotein-agent
$ sudo systemctl start pprotein-agent
```
