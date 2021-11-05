#!/usr/bin/env bash

docker-machine create \
	--driver digitalocean \
	--digitalocean-access-token $DO_TOKEN \
	--digitalocean-size s-1vcpu-1gb-amd \
	--digitalocean-image ubuntu-20-04-x64 \
	--digitalocean-region sgp1 \
	--engine-install-url "https://releases.rancher.com/install-docker/19.03.9.sh" \
	mydocker

###
# --engine-install-url "https://raw.githubusercontent.com/stackupiss/cfdsa/master/setup/19.03.9.sh" \
# Options
# --digitalocean-access-token: required. Your personal access token for the Digital Ocean API.
# --digitalocean-backups: Enable Digital Ocean backups for the droplet.
# --digitalocean-image: The name of the Digital Ocean image to use.
# --digitalocean-ipv6: Enable IPv6 support for the droplet.
# --digitalocean-monitoring: Enable monitoring for the droplet.
# --digitalocean-private-networking: Enable private networking support for the droplet.
# --digitalocean-region: The region to create the droplet in, see Regions API for how to get a list.
# --digitalocean-size: The size of the Digital Ocean droplet (larger than default options are of the form 2gb).
# --digitalocean-ssh-key-fingerprint: Use an existing SSH key instead of creating a new one, see SSH keys.
# --digitalocean-ssh-key-path: SSH private key path.
# --digitalocean-ssh-port: SSH port.
# --digitalocean-ssh-user: SSH username.
# --digitalocean-tags: Comma-separated list of tags to apply to the Droplet, see Droplet tagging
# --digitalocean-userdata: Path to file containing User Data for the droplet.
# 
# 
# CLI option									Environment variable						Default
# --digitalocean-access-token			DIGITALOCEAN_ACCESS_TOKEN				-
# --digitalocean-backups					DIGITALOCEAN_BACKUPS						false
# --digitalocean-image						DIGITALOCEAN_IMAGE						ubuntu-16-04-x64
# --digitalocean-ipv6						DIGITALOCEAN_IPV6							false
# --digitalocean-private-networking	DIGITALOCEAN_PRIVATE_NETWORKING		false
# --digitalocean-region					DIGITALOCEAN_REGION						nyc3
# --digitalocean-size						DIGITALOCEAN_SIZE							s-1vcpu-1gb
# --digitalocean-ssh-key-fingerprint	DIGITALOCEAN_SSH_KEY_FINGERPRINT		-
# --digitalocean-ssh-key-path			DIGITALOCEAN_SSH_KEY_PATH				-
# --digitalocean-ssh-port					DIGITALOCEAN_SSH_PORT					22
# --digitalocean-ssh-user					DIGITALOCEAN_SSH_USER					root
# --digitalocean-tags						DIGITALOCEAN_TAGS							-
# --digitalocean-userdata					DIGITALOCEAN_USERDATA					-
# --digitalocean-monitoring				DIGITALOCEAN_MONITORING					false


