FROM golang:latest AS buildergo

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o app main.go

#usando imagem vazia
FROM scratch

COPY --from=buildergo /app/app /app/app

CMD [ "/app/app" ]
