# fast.rb

The fast.rb library implements Enumerable counterparts that execute each
iteration in a child process. The library can significantly improve
performance in cases where each iteration is expensive in terms of
time.

For example, this might occur when making multiple HTTP requests, when
parsing an array of large JSON documents, or other similar time consuming tasks.

## Examples

FIXME: write better examples

```ruby
require "fast"

fast([1,2,3]).map { _1 * 2 }
```
