# bitcoin-testing-on-docker

Steps:

* Build the docker image: `./build-image.sh`
* Export `$BITCOIN_REPO` in your shell and point them to the [bitcoin core](https://github.com/bitcoin/bitcoin) repository locally.
* Run the docker container: `./run-container.sh`. You can now build and run in ubuntu. In that container, you'll find bitcoin core in `/bitcoin`.

### Other useful commands

#### miscellaneous
- https://beenje.github.io/blog/posts/dockerfile-anti-patterns-and-best-practices/
- `sudo docker images` to see all images
- `git clone -b bip324-enable-4 https://github.com/stratospher/bitcoin-core-ci.git`
- `make -j "$(($(nproc)+1))"`

#### Configure to run an optimized fuzzer build
`CC=clang CXX=clang++ ./configure --enable-fuzz --with-sanitizers=address,fuzzer,undefined`

#### Run optimized fuzzer
`FUZZ=<fuzz_test_name> src/test/fuzz/fuzz /qa-assets/fuzz_seed_corpus/<fuzz_test_name>`

#### Configure to run an unoptimized fuzzer build with debug symbols
`CC=clang CXX=clang++ ./configure CXXFLAGS="-O0 -g" CFLAGS="-O0 -g" --enable-fuzz --with-sanitizers=ad    dress,fuzzer,undefined`

#### Run debug fuzzer with lldb
`FUZZ=<fuzz_test_name> lldb src/test/fuzz/fuzz`
`lldb> run /qa-assets/fuzz_seed_corpus/<fuzz_test_name>`

#### lldb breakpoint and counting
You can set a breakpoint in lldb using `br set -f <file> -l <line> -i <ignore_count>`
You can see how often that breakpoint is hit using `br l`

NOTE: you only need to use the file name like `p2p_transport_serialization.cpp` and NOT the fully qualified relative file name like `src/text/fuzz/p2p_transport-serialization.cpp`

#### To build
Since `./run_container.sh` allocated 3 CPUs, `make -j 3` seems to work well.


