require "redis"
require "version"

class RedisOnRails < String
  attr :redis

  def initialize(key, redis = Redis.current)
    super(key.to_param)
    @redis = redis
  end

  def [](key)
    self.class.new("#{self}:#{key.to_param}", redis)
  end

  [:append, :bitcount, :blpop, :brpop, :brpoplpush, :decr,
  :decrby, :del, :dump, :exists, :expire, :expireat, :get, :getbit,
  :getrange, :getset, :hdel, :hexists, :hget, :hgetall, :hincrby,
  :hincrbyfloat, :hkeys, :hlen, :hmget, :hmset, :hset, :hsetnx, :hvals,
  :incr, :incrby, :incrbyfloat, :lindex, :linsert, :llen, :lpop,
  :lpush, :lpushx, :lrange, :lrem, :lset, :ltrim, :move, :persist,
  :pexpire, :pexpireat, :psetex, :pttl, :publish, :rename, :renamenx,
  :restore, :rpop, :rpoplpush, :rpush, :rpushx, :sadd, :scard,
  :sdiff, :sdiffstore, :set, :setbit, :setex, :setnx, :setrange,
  :sinter, :sinterstore, :sismember, :smembers, :smove, :sort, :spop,
  :srandmember, :srem, :strlen, :subscribe, :sunion, :sunionstore,
  :ttl, :type, :unsubscribe, :watch, :zadd, :zcard, :zcount,
  :zincrby, :zinterstore, :zrange, :zrangebyscore, :zrank, :zrem,
  :zremrangebyrank, :zremrangebyscore, :zrevrange, :zrevrangebyscore,
  :zrevrank, :zscore, :zunionstore].each do |method|
    define_method(method) do |*args, &block|
      redis.send(method, self, *args, &block)
    end
  end
end
