FROM debian:bullseye

ENV LC_CTYPE=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    TERM=xterm-256color

RUN apt-get update && \
    apt-get install -y nmap curl wget netcat build-essential jq strace ltrace \
      gcc-multilib net-tools neovim vim-scripts xxd gdb gdb-multiarch procps \
      git make tmux httpie python3-pip sudo perl tar grep zstd

RUN git clone https://github.com/radare/radare2 && \
    cd radare2 && \
    sys/install.sh

RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && \
    ./setup.sh && \ 
    git clone https://github.com/jerdna-regeiz/splitmind && \
    echo "source $PWD/splitmind/gdbinit.py" >> ~/.gdbinit

RUN git clone https://github.com/niklasb/libc-database && \
    cd libc-database && \
    ./get ubuntu debian

RUN apt-get install -y python3-cryptography python3-gmpy2 checksec dnsutils ftp telnet nasm && \
    pip3 install keystone-engine unicorn capstone ropper

RUN apt-get install -y openssh-server smbclient

COPY dots/ /root/
COPY etc/ /etc/

RUN echo "source ~/.gdbinit-maxmind.py" >> ~/.gdbinit

# Fix GDB/TMUX bug
RUN pip install -U pwntools==4.8.0b0

WORKDIR "/ctf"
CMD ["tmux"]
