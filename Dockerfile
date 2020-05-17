FROM ubuntu:16.04 as builder

RUN apt-get update && apt-get install -y \
  build-essential autoconf zlib1g-dev

WORKDIR /build

COPY . .

RUN autoconf
RUN autoheader
RUN ./configure --enable-static
RUN make PROGRAMS="dropbear"

FROM scratch

COPY --from=builder /build/dropbear /lolbear
COPY --from=builder /build/hostkey /hostkey
