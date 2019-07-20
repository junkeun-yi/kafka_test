all: install

CFLAGS+=-O0 -lrdkafka
LDFLAGS+=-lrdkafka

OBJS=kafka_producer.o kafka_consumer.o

install: kafka_producer kafka_consumer

kafka_procuder: kafka_producer.o
	$(CC) $(CFLAGS) kafka_producer.c -o kafka_producer.o $(LDFLAGS)
	
kafka_consumer: kafka_consumer.o
	$(CC) $(CFLAGS) kafka_consumer.c -o kafka_consumer.o $(LDFLAGS)

clean:
	rm -f $(OBJS)
