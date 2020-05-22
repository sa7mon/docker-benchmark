FROM alpine:latest

ENV TESTFILESIZE=10G

RUN apk update
RUN apk add fio jq

COPY runTestSuite.sh /
RUN chmod +x /runTestSuite.sh

ENTRYPOINT /runTestSuite.sh $TESTFILESIZE
