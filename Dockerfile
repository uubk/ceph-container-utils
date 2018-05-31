FROM ceph/daemon:latest
ADD location.sh /
ENTRYPOINT ["/location.sh"]
