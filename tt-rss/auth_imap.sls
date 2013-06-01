
"/etc/tt-rss/auth_imap.php":
  file.managed:
    - source:
      - "salt://tt-rss/static/conf/auth_imap.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/auth_imap.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/auth_imap.php"

