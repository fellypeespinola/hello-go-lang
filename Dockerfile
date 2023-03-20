FROM golang:alpine as multistage

WORKDIR /usr/src/app

COPY ./src .

RUN go build

FROM scratch

COPY --from=multistage /usr/src/app /usr/src/app

CMD ["/usr/src/app/fullcycle"]

