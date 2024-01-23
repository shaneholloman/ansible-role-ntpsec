# Ansible Role `ntpsec`

This role sets up time synchronization using NTPSec.
NTPSec is a secure, hardened, and improved implementation of Network Time Protocol derived from NTP Classic, Dave Mills’s original. It is designed to resist attacks from both outside and the inside of the network.

## Requirements

NTS was implemented in NTPSec 1.1.4. Since this role uses the package management to install NTPSec, the target system's distribution needs to provide at least NTPSec 1.1.4.
Furthermore, it needs to provide at least OpenSSL 1.1, since NTS requires TLSv1.3, which is not supported by older version of OpenSSL.

## Role Variables

`ntpsec_client_servers`

A list of servers to synchronize with.

Defaults to:

```yml
ntpsec_client_servers:
  - 0.pool.ntp.org
  - 1.pool.ntp.org
  - 2.pool.ntp.org
  - 3.pool.ntp.org
```

## Dependencies

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
- hosts: servers
  roles:
    - role: shaneholloman.ntpsec
      vars:
        ntpsec_client_servers:
          - 0.pool.ntp.org
          - 1.pool.ntp.org
          - 2.pool.ntp.org
          - 3.pool.ntp.org
```

or just:

```yml
- hosts: servers
  roles:
    - role: shaneholloman.ntpsec
      ntpsec_client_servers:
        - 0.pool.ntp.org
        - 1.pool.ntp.org
        - 2.pool.ntp.org
        - 3.pool.ntp.org
```

## License

Unlicense

## Author Information

This role was created in 2023
