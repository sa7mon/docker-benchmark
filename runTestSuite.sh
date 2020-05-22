#!/bin/sh

TESTFILESIZE="$1"

echo "Using test file size: $TESTFILESIZE"

echo "Running 1M Random Read test..."
fio --name=1M-randread --output-format=json --filename=test --sync=1 --rw=randread --bs=1M --numjobs=1 --iodepth=4 --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 | jq '.jobs[0] | {jobname: .jobname, read_bw_mbytes: (.read.bw * 0.001024), read_iops: .read.iops, write_bw_mbytes: (.write.bw * 0.001024), write_iops: .write.iops }'  && rm test

echo "Running 1M Random Write test..."
fio --name=1M-randwrite --output-format=json --filename=test --s--filename=test --sync=1 --rw=randwrite --bs=1M --numjobs=1 --iodepth=4 --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 | jq '.jobs[0] | {jobname: .jobname, read_bw_mbytes: (.read.bw * 0.001024), read_iops: .read.iops, write_bw_mbytes: (.write.bw * 0.001024), write_iops: .write.iops }' && rm test

echo "Running 1M Sequential Read test..."
fio --name=1M-seqread --output-format=json --filename=test --sync=1 --rw=read --bs=1M --numjobs=1 --iodepth=4 --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 | jq '.jobs[0] | {jobname: .jobname, read_bw_mbytes: (.read.bw * 0.001024), read_iops: .read.iops, write_bw_mbytes: (.write.bw * 0.001024), write_iops: .write.iops }' && rm test

echo "Running 1M Sequential Write test..."
fio --name=1M-seqwrite --output-format=json --filename=test --sync=1 --rw=write --bs=1M --numjobs=1 --iodepth=4 --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 | jq '.jobs[0] | {jobname: .jobname, read_bw_mbytes: (.read.bw * 0.001024), read_iops: .read.iops, write_bw_mbytes: (.write.bw * 0.001024), write_iops: .write.iops }' && rm test

echo "Running 4K Random Read test..."
fio --name=4k-randread --output-format=json --filename=test --sync=1 --rw=randread --bs=4k --numjobs=1 --iodepth=4 --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 | jq '.jobs[0] | {jobname: .jobname, read_bw_mbytes: (.read.bw * 0.001024), read_iops: .read.iops, write_bw_mbytes: (.write.bw * 0.001024), write_iops: .write.iops }' && rm test

echo "Running 4K Random Write test..."
fio --name=4k-randwrite --output-format=json --filename=test --sync=1 --rw=randwrite --bs=4k --numjobs=1 --iodepth=4 --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 | jq '.jobs[0] | {jobname: .jobname, read_bw_mbytes: (.read.bw * 0.001024), read_iops: .read.iops, write_bw_mbytes: (.write.bw * 0.001024), write_iops: .write.iops }' && rm test

echo "Running 4K Sequential Read test..."
fio --name=4k-seqread --output-format=json --filename=test --sync=1 --rw=read --bs=4k --numjobs=1 --iodepth=4 --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 | jq '.jobs[0] | {jobname: .jobname, read_bw_mbytes: (.read.bw * 0.001024), read_iops: .read.iops, write_bw_mbytes: (.write.bw * 0.001024), write_iops: .write.iops }' && rm test

echo "Running 4K Sequential Write test..."
fio --name=4k-seqwrite --output-format=json --filename=test --sync=1 --rw=write --bs=4k --numjobs=1 --iodepth=4 --group_reporting --filesize=$TESTFILESIZE --ioengine=libaio --runtime=300 | jq '.jobs[0] | {jobname: .jobname, read_bw_mbytes: (.read.bw * 0.001024), read_iops: .read.iops, write_bw_mbytes: (.write.bw * 0.001024), write_iops: .write.iops }' && rm test
