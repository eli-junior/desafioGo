FROM golang:alpine as builder

WORKDIR /app

RUN echo $'package main \n  import "fmt" \n func main() { \n fmt.Println("Full Cycle R0X") \n }' > main.go

RUN go build main.go && \
    rm -f main.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]
