FROM alpine

COPY builder.sh /app/

CMD ["/app/builder.sh"]
