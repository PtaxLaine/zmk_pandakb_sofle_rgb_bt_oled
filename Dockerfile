FROM zmk-sofle-pkb-build-raw

RUN rm -rf /workspaces/zmk && mkdir -p /workspaces/bin
VOLUME /workspaces/bin
COPY zmk.git /workspaces/zmk
COPY config/west.yml /workspaces/
COPY builder.sh /workspaces/

RUN cd /workspaces/zmk && \
    west init --mf /workspaces/west.yml -l app && \
    west update

WORKDIR /workspaces/zmk/app
CMD /workspaces/builder.sh

