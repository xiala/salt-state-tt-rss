include:
  - tt-rss.contrib

"/etc/tt-rss/auth_imap.php":
  file.managed:
    - source:
      - "salt://tt-rss/static/conf/auth_imap.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/auth_imap.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/auth_imap.php"

extends:
  file:
    "/etc/tt-rss/config.php":
      - auth_imap: True
