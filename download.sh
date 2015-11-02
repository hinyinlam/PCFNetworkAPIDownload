#!/bin/bash
TOKEN=please_fill_in_your_token_here

declare -A FILES
FILES[p-spring-cloud-services-1.0.0.pivotal]=https://network.pivotal.io/api/v2/products/p-spring-cloud-services/releases/603/product_files/2948/download
FILES[p-rabbitmq-1.4.6.0.pivotal]=https://network.pivotal.io/api/v2/products/pivotal-rabbitmq-service/releases/587/product_files/2912/download
FILES[p-mysql-1.7.0.0.pivotal]=https://network.pivotal.io/api/v2/products/p-mysql/releases/601/product_files/2943/download
FILES[cf-1.6.0.pivotal]=https://network.pivotal.io/api/v2/products/elastic-runtime/releases/608/product_files/2947/download
FILES[pcf-vsphere-1.6.0.ova]=https://network.pivotal.io/api/v2/products/ops-manager/releases/588/product_files/2917/download
FILES[p-metrics-1.5.0.pivotal]=https://network.pivotal.io/api/v2/products/ops-metrics/releases/598/product_files/2937/download
FILES[p-metrics-1.4.1.0.pivotal]=https://network.pivotal.io/api/v2/products/ops-metrics/releases/298/product_files/2151/download
FILES[cf-insight-1.5.0.60.pivotal]=https://network.pivotal.io/api/v2/products/p-insight/releases/299/product_files/2152/download
FILES[bosh-stemcell-2682.1-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/322/product_files/2234/download
FILES[bosh-stemcell-2690.3-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/321/product_files/2233/download
FILES[bosh-stemcell-2840-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/319/product_files/2226/download
FILES[bosh-stemcell-2865.1-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/318/product_files/2222/download
FILES[bosh-stemcell-2983-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/320/product_files/2231/download
FILES[bosh-stemcell-2989-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/317/product_files/2218/download
FILES[bosh-stemcell-3012-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/323/product_files/2238/download
FILES[bosh-stemcell-3026-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/328/product_files/2327/download
FILES[bosh-stemcell-3062-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/490/product_files/2642/download
FILES[bosh-stemcell-3074-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/564/product_files/2820/download
FILES[bosh-stemcell-3094-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/578/product_files/2886/download
FILES[bosh-stemcell-3100-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/596/product_files/2930/download
FILES[bosh-stemcell-3112-vsphere-esxi-ubuntu-trusty-go_agent.tgz]=https://network.pivotal.io/api/v2/products/stemcells/releases/619/product_files/2979/download
FILES[p-mysql-1.7.0.0.pivotal]=https://network.pivotal.io/api/v2/products/p-mysql/releases/601/product_files/2943/download
FILES[p-rabbitmq-1.4.7.0.pivotal]=https://network.pivotal.io/api/v2/products/pivotal-rabbitmq-service/releases/618/product_files/2976/download
FILES[p-gemfire-1.0.0.0]=https://network.pivotal.io/api/v2/products/p-gemfire/releases/469/product_files/2440/download
FILES[p-gemfire-1.1.0.0.pivotal]=https://network.pivotal.io/api/v2/products/p-gemfire/releases/540/product_files/2772/download

for FILENAME in "${!FILES[@]}"; do
	echo Begin download of $FILENAME
	nohup wget --continue --no-check-certificate -O "$FILENAME" --post-data=\'\' --header="Authorization: Token token=\"$TOKEN\"" "${FILES[$FILENAME]}" > /root/wget-$FILENAME.log 2>&1 &
done;

