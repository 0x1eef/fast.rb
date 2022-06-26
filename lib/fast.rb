##
# The {Fast} module implements Enumerable counterparts that execute each
# iteration in a child process. The module can significantly improve
# performance in cases where each iteration is expensive in terms of time.
#
# For example, this might occur when making multiple HTTP requests, when
# parsing an array of large JSON documents, or other similar time consuming
# tasks.
module Fast
  require "xchan"
  require_relative "fast/object_mixin"

  def map(&b)
    fast_map(&b).map(&:pop)
  end

  def select(&b)
    fast_map(&b).select(&:pop).map(&:pop)
  end

  def reject(&b)
    fast_map(&b).reject(&:pop).map(&:pop)
  end

  def find(&b)
    fast_map(&b).find(&:pop)&.then(&:pop)
  end

  def count(&b)
    fast_map(&b).count(&:pop)
  end

  def any?(&b)
    fast_map(&b).any?(&:pop)
  end

  def sum(&b)
    fast_map(&b).sum(&:pop)
  end

  private

  def fast_map
    ch = xchan
    enum.map
        .with_index { |e, i| fork { ch.send [e, yield(e), i] } }
        .each { Process.wait(_1) }
    enum.map { ch.recv }
        .sort_by(&:pop)
        .tap { ch.close }
  end
end
