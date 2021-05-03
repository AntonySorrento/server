#!/usr/bin/env bash
if [[ "${AUTOINDEX}" == "off" ]]; then
	sed -e "s/autoindex on/autoindex off/" /etc/nginx/sites-available/default &> /etc/nginx/sites-available/default;
fi
