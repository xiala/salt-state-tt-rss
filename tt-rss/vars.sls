
{% set ttrss = pillar.get("ttrss", {}) -%}
{% set base = ttrss.get("base", "/srv/tt-rss") -%}
{% set app = ttrss.get("app", base + "/www") -%}
{% set cache = ttrss.get("cache", base + "/data") -%}
{% set lock = ttrss.get('lock', base + "/lock") -%}
{% set user = ttrss.get('user', 'ttrss') -%}
{% set group = ttrss.get('group', 'ttrss') -%}
{% set db = ttrss.get('db', {}) -%}
{% set db_user = db.get('user', 'ttrss') -%}
{% set db_pass = db.get('pass', None) -%}
{% set db_db = db.get('db', 'ttrss') -%}
