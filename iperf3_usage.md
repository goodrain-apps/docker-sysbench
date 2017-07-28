## iperf3 on Docker

Iperf3 on Docker environment.


## Example Usage

ACP Usage：
    create tow applications.
    One server,One client

#### for server

```
iperf3 -s -i 5
```

#### for client
```
iperf3 -c [server_ip] -F [all_file_path] -t [time,default=10s] -i [show info]
```





