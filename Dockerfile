FROM alpine:latest

ENV TESTFILESIZE=10G
ENV IODEPTH=4

RUN apk update
RUN apk add fio

COPY runTestSuite.sh /
RUN chmod +x /runTestSuite.sh

ENTRYPOINT /runTestSuite.sh $TESTFILESIZE $IODEPTH
