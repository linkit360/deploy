FROM golang:1.8.1-alpine AS build-env

RUN apk add --progress --no-cache bash curl nano git openssh-client

COPY ssh/ /root/.ssh
RUN git config --global url."git@github.com:".insteadOf "https://github.com/" \
    && mkdir -p /go/bin \
    && mkdir -p /go/src

# Get src
RUN echo "
RUN go get -v -u github.com/linkit360/go-mid/src
COPY server.go /go/src/github.com/linkit360/xmp-api


FROM golang AS myapp
COPY . /myapp
RUN cd /myapp && go build

FROM scratch
COPY --from=myapp /myapp /usr/bin/myapp

# https://github.com/moby/moby/issues/3378#issuecomment-296374380

# 1 docker - build from src for dev
# volume

# 2 docker - with binaries for live
# copy from volume