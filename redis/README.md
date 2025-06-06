# Redis

## Config

Config file: ``/etc/redis/redis.conf``

Set the ``supervised`` directive to your OS's init system.
- For Ubuntu, this is ``systemd``
- This provides you more control over the Redis system
```
supervised systemd
```

Set password 
```
requirepass <password>
```

Add Redis settings to .env file
```
# Redis Settings
WP_REDIS_HOST="127.0.0.1"
WP_REDIS_PORT=6379
WP_REDIS_PASSWORD="<password>"
??? WP_REDIS_PREFIX="ocls:"
WP_REDIS_DATABASE=0
WP_REDIS_TIMEOUT=1
WP_REDIS_READ_TIMEOUT=1
```


## Redis CLI

``redis-cli`` | Access Redis CLI interactive mode

``> QUIT`` | Exit Redis CLI

``> ping`` | Test Redis is connected
- Returns "PONG" if connected

``> AUTH <password>`` | Authorize current user
- Redis password can be found in configuration file. Config file for WP-OCLS is .env

``> INFO`` | Get installation info
- CLI alternative: ``redis-cli info``

``> FLUSHALL`` | Clear cache for all databases
- WP-CLI alternative: ``wp cache flush``
- Returns "OK" if cleared successfully
- WP UI alternative: click Settings > Redis > "the blue button"

``> KEYS *`` | View all keys

``> KEYS <pattern>`` | Return all keys matching a pattern


## Install

### Resources

[How to Install and Secure Redis on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-20-04) from DigitalOcean