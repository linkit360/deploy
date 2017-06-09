.PHONY: update

update:
	scp -i ~/.ssh/beeline.pem centos@52.59.112.128:/home/centos/linkit/*.prod.yml beeline
	scp -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201:/home/centos/linkit/*prod.yml mobilink
	#scp -i ~/.ssh/yondu.pem  centos@52.76.153.135:/home/centos/linkit/*prod.yml yondu
	scp -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67:/home/centos/linkit/*.prod.yml cheese
	scp -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67:/home/centos/qrtech/*.prod.yml qrtech
