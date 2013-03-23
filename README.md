my_delegate.rb
==============

My own basic and naive implementation of a delegate in ruby

I just wanted to see how hard it would be to create a delegate in ruby, after seeing [how complicated the activesupport code looked](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/module/delegation.rb)

Of course my delegate is less featured, but it was a nice experience to code this anyway.

I did two implementations, the first one is a custom one I made with class variables.

It is much slower (~ 3 times) to call the delegated methods with this implementation.

The other implementation I made uses metaprogramming, as I saw on the activesupport implementation.

It is really faster when a delegated method is called, however, delegating a method is 100 times slower ...
