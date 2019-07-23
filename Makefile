all: install

CFLAGS = -ggdb -Og -g3 -fno-omit-frame-pointer -O0 -lrdkafka
LDFLAGS = -lrdkafka

OBJS=kafka_producer.o kafka_consumer.o dumb_producer.o

install: kafka_producer kafka_consumer dumb_producer

kafka_procuder: kafka_producer.o
	$(CC) $(CFLAGS) kafka_producer.c -o kafka_producer.o $(LDFLAGS)

dumb_procuder: dumb_producer.o
	$(CC) $(CFLAGS) dumb_producer.c -o dumb_producer.o $(LDFLAGS)
	
kafka_consumer: kafka_consumer.o
	$(CC) $(CFLAGS) kafka_consumer.c -o kafka_consumer.o $(LDFLAGS)

clean:
	rm -f $(OBJS)
