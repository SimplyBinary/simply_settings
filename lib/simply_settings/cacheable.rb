module SimplySettings
  attr_writer :cache
  attr_writer :key_prefix

  def cache
    @cache ||= AbstractCache
  end

  def key_prefix
    @key_prefix ||= self.name.underscore
  end

  private

  def cached_find(setting)
    cache.fetch("#{key_prefix}_#{setting}") { find(setting) }
  end

  class AbstractCache
    class << self
      def fetch(key, &block)
        yield
      end

      def delete(key)
        #noop
      end

      def read(key)
        #noop
      end

      def write(key)
        #noop
      end
    end
  end
  
end
