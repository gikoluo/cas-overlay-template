#!/bin/sh

#cd /data/zf_workspace/internal/cas-overlay-template

tar --exclude cas/META-INF -czf /tmp/cassrv-files.tgz etc/cas -C target cas

echo ""

ls -asl /tmp/cassrv-files.tgz
exit 0