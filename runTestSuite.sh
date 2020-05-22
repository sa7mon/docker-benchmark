#!/bin/sh

TESTFILESIZE="$1"
IODEPTH="$2"

echo "Using test file size: $TESTFILESIZE and IO depth: $IODEPTH"

echo "Running 1M Random Read test..."
fio --name=1M-randread --filename=test --sync=1 --rw=randread --bs=1M --numjobs=1 --iodepth=$IODEPTH --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 && rm test

echo "Running 1M Random Write test..."
fio --name=1M-randwrite --filename=test --sync=1 --rw=randwrite --bs=1M --numjobs=1 --iodepth=$IODEPTH --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 && rm test

echo "Running 1M Sequential Read test..."
fio --name=1M-seqread --filename=test --sync=1 --rw=read --bs=1M --numjobs=1 --iodepth=$IODEPTH --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 && rm test

echo "Running 1M Sequential Write test..."
fio --name=1M-seqwrite --filename=test --sync=1 --rw=write --bs=1M --numjobs=1 --iodepth=$IODEPTH --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 && rm test

echo "Running 4K Random Read test..."
fio --name=4k-randread --filename=test --sync=1 --rw=randread --bs=4k --numjobs=1 --iodepth=$IODEPTH --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 && rm test

echo "Running 4K Random Write test..."
fio --name=4k-randwrite --filename=test --sync=1 --rw=randwrite --bs=4k --numjobs=1 --iodepth=$IODEPTH --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 && rm test

echo "Running 4K Sequential Read test..."
fio --name=4k-seqread --filename=test --sync=1 --rw=read --bs=4k --numjobs=1 --iodepth=$IODEPTH --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 && rm test

echo "Running 4K Sequential Write test..."
fio --name=4k-seqwrite --filename=test --sync=1 --rw=write --bs=4k --numjobs=1 --iodepth=$IODEPTH --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 && rm test
