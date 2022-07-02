FROM golang:1.18-alpine as build

WORKDIR /app

COPY go.* ./

RUN go mod download

COPY *.go ./

RUN go build -o /main

FROM scratch as execute

WORKDIR /

COPY --from=build /main /

ENTRYPOINT [ "/main" ]