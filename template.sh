#!/bin/bash
cat > /opt/consul/config.json <<-EOF
{
  "datacenter": "$CONSUL_DC",
  "bootstrap_expect": $CONSUL_BOOTSTRAP_EXPECT,
  "bind_addr": "$CONSUL_BIND",
  "client_addr": "$CONSUL_CLIENT",
  "data_dir": "$CONSUL_DATA_DIR",
  "log_level": "$CONSUL_LOG_LEVEL",
  "server": $CONSUL_SERVER,
  "enable_syslog": $CONSUL_SYSLOG,
  "ui": $CONSUL_UI,
  "start_join": $CONSUL_JOIN,
  "acl_datacenter": "$CONSUL_ACL_DATACENTER",
  "acl_default_policy": "$CONSUL_DEFAULT_POLICY",
  "acl_master_token": "$CONSUL_MASTER_TOKEN"
}
