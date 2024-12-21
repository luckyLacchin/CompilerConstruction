FROM ubuntu:20.04

ARG USERNAME=compilerdev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && apt-get update \
  && apt-get install -y \
  bear \
  bison \
  build-essential \
  clang-9 \
  curl \
  flex \
  ghc \
  git \
  libedit-dev \
  libgmp-dev \
  libz-dev \
  llvm-9 \
  sudo \
  && rm -rf /var/lib/apt/lists/* \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

RUN curl -sSL https://get.haskellstack.org/ | sh \
    && stack install BNFC alex happy \
    && BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_MINIMAL=1 curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh \
    && echo export PATH="$PATH:$HOME/.ghcup/bin:$HOME/.cabal/bin:$HOME/.local/bin" >> "$HOME/.profile"

ENTRYPOINT ["bash"]
