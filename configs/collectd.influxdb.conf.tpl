FQDNLookup true
Interval 10
Timeout 2
ReadThreads 5

LoadPlugin python
LoadPlugin network

<Plugin network>
  Server "{{ EP_HOST }}" "{{ EP_PORT }}"
</Plugin>

<Plugin python>
  Import "fritzcollectd"

  <Module fritzcollectd>
    Address "{{ FRITZ_IP | default("192.168.178.1") }}"
    Port 49000
    User "{{ FRITZ_USER | default("collectd") }}"
    Password "{{ FRITZ_PASSWORD }}"
    Hostname "FritzBox"
    Instance "1"
    Verbose "False"
  </Module>
</Plugin>
