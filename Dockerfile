FROM golang:1.22.4-bookworm
# docker run -dit -v /Users/zen/Github/WhisperAndTrans:/data --name test golang:1.22.4-bookworm bash
LABEL authors="zen"
# 更换国内源
COPY debian.sources /etc/apt/sources.list.d/
# 更新软件
RUN apt update

COPY . .
# 配置env
RUN go env -w GO111MODULE=on
RUN go env -w GOPROXY=https://goproxy.cn,direct
RUN go env -w GOBIN=/go/bin

# 启动程序
ENTRYPOINT ["htop"]