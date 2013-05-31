
include:
  - nginx.ssl
  - php.fpm
  - php.suhosin
  - php.mcrypt
  - php.curl

tt-rss:
  service.running:
    - require:
      - file: "/etc/default/tt-rss"
      - file: "/etc/init.d/tt-rss"
      - file: "/etc/tt-rss/*"
      - git: "/srv/tt-rss"
    - watch:
      - file: "/etc/default/tt-rss"
      - file: "/etc/init.d/tt-rss"
      - file: "/etc/tt-rss/*"
      - git: "/srv/tt-rss"

"/etc/default/tt-rss":
  file.managed:
    - source:
      - "salt://tt-rss/static/default.{{ grains.id }}"
      - "salt://tt-rss/static/default.{{ grains.os }}"
      - "salt://tt-rss/static/default"

"/etc/init.d/tt-rss":
  file.managed:
    - source:
      - "salt://tt-rss/static/init.{{ grains.id }}"
      - "salt://tt-rss/static/init.{{ grains.os }}"
      - "salt://tt-rss/static/init"

"/etc/logrotate.d/tt-rss":
  file.managed:
    - source:
      - "salt://tt-rss/static/logrotate.{{ grains.id }}"
      - "salt://tt-rss/static/logrotate.{{ grains.os }}"
      - "salt://tt-rss/static/logrotate"

"/srv/tt-rss":
  git.latest:
    - name: "git@git.xiala.net:xiala-forks/tt-rss.git"
    - rev: "1.7.8"

"/etc/tt-rss/config.php":
  file.managed:
    - source:
      - "salt://tt-rss/static/conf/config.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/config.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/config.php"

"/etc/tt-rss/database.php":
  file.managed:
    - source:
      - "salt://tt-rss/static/conf/database.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/database.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/database.php"
