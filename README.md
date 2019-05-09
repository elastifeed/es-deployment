# Elastifeed infrastructure scripts

Ansible playbook for deploying the elastifeed infrastructure. This includes (for now) an elasticsearch cluster and the corresponding kibana dashboard.

# Access the running installation

  > You can use ssh to forward the ports: `ssh -L 5601:localhost:5601 -L 9200:localhost:9200 swl.xvzf.tech`

  *Elasticsearch* can be accessed on `(localhost|hostip):9200` ([click](http://localhost:9200))
  *Kibana* can be accessed on `(localhost|hostip):5601` ([click](http://localhost:5601))
