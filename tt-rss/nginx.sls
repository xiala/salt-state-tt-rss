{% import "tt-rss/vars.sls" as ttrss with context %}

"/etc/nginx/salt-sites/tt-rss.conf":
  file.managed:
    - source:
      - "salt://tt-rss/static/nginx.conf.{{ grains.id }}"
      - "salt://tt-rss/static/nginx.conf.{{ grains.os }}"
      - "salt://tt-rss/static/nginx.conf"
    - template: jinja
    - context:
      vhost:
        name: "{{ ttrss.name }}"
        listen_http: "{{ ttrss.listen_http }}"
        listen_https: "{{ ttrss.listen_https }}"
        error_log: "{{ ttrss.log }}/ttrss_error.log"
        access_log: "{{ ttrss.log }}/ttrss_access.log"



