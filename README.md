# Docker Benchmark
A simple container to benchmark Docker filesystem performance using fio

## Usage

### Default Settings with verbose output

`docker run hothamandcheese/docker-benchmark`

### 1GB Test File

`docker run -e TESTFILESIZE="1G" hothamandcheese/docker-benchmark`

### Compact JSON Output

`docker run hothamandcheese/docker-benchmark:json`

## Options

|   Variable   | Description                | Default |
|:------------:|----------------------------|:-------:|
| TESTFILESIZE | Size of test file to write |   10G   |

## Tests

The following tests will be run using fio:

* 1M Random Read
* 1M Random Write
* 1M Sequential Read
* 1M Sequential Write
* 4k Random Read
* 4k Random Write
* 4k Sequential Read
* 4k Sequential Write
