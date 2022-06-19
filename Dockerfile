FROM    triksox/mod_perl:0.0.1
ENV     DEBIAN_FRONTEND=noninteractive
RUN     apt update && \
        apt install -y \
        mysql-server mysql-client libmysqlclient-dev \
        libqrencode-dev \
        imagemagick \
        && \
        rm -rf /var/lib/apt/lists/* \
        && \
        cpan JSON::XS \
        Badger Template DBI DBD::mysql \
        Cache::Memcached HTML::Strip HTML::Entities \
        Image::Size Image::Info LWP::UserAgent WWW::Mechanize \
        SVG::Parser Text::QRCode \
        Mail::Sender Email::Sender Geo::Coder::OpenCage IO::String IPC::Run \
        Text::Markdown Spreadsheet::WriteExcel XML::LibXML
COPY    build /build
RUN     cd /build/badger && \
        perl Makefile.PL && \
        make && \
        make test && \
        make install && \
        cd /build/badger-database && \
        perl Makefile.PL && \
        make && \
        make test && \
        make install && \
        cd /build/contentity && \
        perl Makefile.PL && \
        make && \
        make test && \
        make install