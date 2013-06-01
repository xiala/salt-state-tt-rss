
"/etc/nginx/salt-sites/tt-rss.conf":
  file.managed:
    - source:
      - "salt://tt-rss/static/nginx.conf.{{ grains.id }}"
      - "salt://tt-rss/static/nginx.conf.{{ grains.os }}"
      - "salt://tt-rss/static/nginx.conf"
    - template: jinja


