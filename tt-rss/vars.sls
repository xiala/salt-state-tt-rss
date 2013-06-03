# basic tt-rss config
{% set ttrss = pillar.get("ttrss", {}) -%}
{% set name = ttrss.get("name", "reader.xiala.net") -%}
{% set url = ttrss.get("url", "https://"+name) -%}
{% set base = ttrss.get("base", "/srv/tt-rss") -%}
{% set app = ttrss.get("app", base + "/www") -%}
{% set contrib = ttrss.get("contrib", base + "/contrib") -%}
{% set cache = ttrss.get("cache", base + "/data") -%}
{% set log = ttrss.get("log", base + "/log") -%}
{% set lock = ttrss.get('lock', base + "/lock") -%}
{% set run = ttrss.get('run', base + "/run") -%}
{% set tmp = ttrss.get('tmp', base + "/tmp") -%}
{% set user = ttrss.get('user', 'ttrss') -%}
{% set group = ttrss.get('group', 'ttrss') -%}
{% set crypt = ttrss.get('crypt', '') -%}
# php settings
{% set sessions = ttrss.get('sessions', tmp + "/sessions") -%}
{% set upload_dir = ttrss.get('upload_dir', tmp + "/upload.tmp") -%}
# db settings
{% set db = ttrss.get('db', {}) -%}
{% set db_user = db.get('user', 'ttrss') -%}
{% set db_pass = db.get('pass', None) -%}
{% set db_db = db.get('db', 'ttrss') -%}
# nginx settings
{% set listen_http = ttrss.get("listen_http", "80 default") %}
{% set listen_https = ttrss.get("listen_https", "443 default ssl") %}
