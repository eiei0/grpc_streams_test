# grpc_streams_test
A collection of example endpoints to showcase the client/server streaming feature in gRPC. These are incredibly simple examples, built only to educate how this feature is used with the ruby programming language.

### Getting Started
> The following directions assume that you have
> 1. installed ruby
> 2. installed bundler
- Start by running `bundle install` from the root of the project to download the server dependencies ([`grpc`](https://github.com/grpc/grpc/tree/master/src/ruby), [`gruf`](https://github.com/bigcommerce/gruf), etc)
- Running `bundle exec gruf` from the root of the project should spin up the gruf server on port `9001` by default.

There are two endpoints:
- `ListFoos`(server-side streaming method)
- `CreateFoos` (client-side streaming method).

I've created a couple of ruby scripts to act as a client to hit each endpoint which are located in the `scripts` directory.

#### Testing the client-side endpoint
When this script is run, it is expected for nothing to output in the console window it ran it, but on the server, it should print the "foos" to `$STDOUT`.
```
$ ruby scripts/create_foos.rb
```
#### Testing the server-side endpoint
When this script is run, the "foos" are expected to print to the same console window's `$STDOUT`.
```
$ ruby scripts/list_foos.rb
foo_1
foo_2
...
foo_19999
foo_20000
```

### Additional Resources
- [gRPC Basics - Streaming RPCs](https://grpc.io/docs/languages/ruby/basics/#streaming-rpcs)
- [gRPC Basics: Ruby Sample Code](https://github.com/grpc/grpc/tree/v1.20.0/examples/ruby/route_guide)
