FROM    triksox/mod_perl:0.0.2
ENV     DEBIAN_FRONTEND=noninteractive
RUN     apt update && \
        apt install -y \
        mysql-server mysql-client libmysqlclient-dev \
        libqrencode-dev \
        imagemagick \
        && \
        rm -rf /var/lib/apt/lists/* \
        && \
        cpan Cpanel::JSON::XS \
        Badger Template DBI DBD::mysql \
        Cache::Memcached HTML::Strip HTML::Entities \
        Image::Size Image::Info LWP::UserAgent WWW::Mechanize \
        SVG::Parser Text::QRCode \
        IO::String IPC::Run \
        Mail::Sender Email::Sender Email::Simple Email::MIME \
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