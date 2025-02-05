FROM golang:1.13.5-alpine as builder

RUN apk --update add git;
RUN go get -d github.com/aminueza/klar
RUN go build ./src/github.com/aminueza/klar

FROM alpine:3.8

RUN apk add --no-cache ca-certificates
COPY --from=builder /go/klar /klar

ENTRYPOINT ["/klar"]
