# crom

CRystal Object Mapper

See the backends for usage.

***/!\ Work in progress, not ready for production use /!\***

## TODO
- [ ] Add critera to fetch data
- [ ] Add more backeds ( MongoDB, Postgres, ... )

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  crom:
    github: TechMagister/crom.cr
```


## Backend

Feature | MySQL | Redis
-------| -------|-------
Insert | x | x
Delete | x | x
Update | x | x
Aggregation | x | TODO
Get by id | x | x
Get all | x | x
Delete all | x | x
Count | x | x

- [MySQL](https://github.com/TechMagister/crom-mysql.cr) backend, support aggregation, insert,update, delete, get by id
- [Redis](https://github.com/TechMagister/crom-redis.cr) backend, doesn't support aggregation for now, use JSON to store the data


## Contributing

1. Fork it ( https://github.com/TechMagister/crom.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [TechMagister](https://github.com/TechMagister) Arnaud Fernandés - creator, maintainer
