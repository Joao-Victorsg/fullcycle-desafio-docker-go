FROM golang:1.19.0-alpine3.16 as builder

WORKDIR /app

RUN go mod init desafioGo
             
COPY desafio.go .

RUN go build ./desafio.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/desafio .

CMD ["/app/desafio"]