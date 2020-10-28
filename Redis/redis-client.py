
import redis

REDIS_PORT = 6379
REDIS_HOST = 'localhost'

r = redis.Redis(host=REDIS_HOST, port=REDIS_PORT, db=0)


print(r.ping())
r.set('nombre', 'ignacio')
print(r.get('nombre'))

r.lpush("alumno","ignacio")
r.lpush("alumno","fran")
print(r.lrange("alumno",0,-1))

r.sadd('databases', 'mysql')
r.sadd('databases', 'mysql')
r.sadd('databases', 'mongodb')
print(r.smembers('databases'))

p = r.pubsub()
p.subscribe('Mi primer canal')
r.publish('Mi primer canal', 'Hola, como andas?')
print(p.get_message())




