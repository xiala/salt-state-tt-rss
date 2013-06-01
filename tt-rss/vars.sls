
{% set ttrss = pillar.get("ttrss", {}) -%}
{% set base = ttrss.get("base", "/srv/tt-rss") -%}
{% set app = ttrss.get("app", base + "/www") -%}
{% set contrib = ttrss.get("contrib", base + "/contrib") -%}
{% set cache = ttrss.get("cache", base + "/data") -%}
{% set log = ttrss.get("log", base + "/log") -%}
{% set lock = ttrss.get('lock', base + "/lock") -%}
{% set run = ttrss.get('run', base + "/run") -%}
{% set tmp = ttrss.get('tmp', base + "/tmp") -%}
{% set sessions = ttrss.get('sessions', tmp + "/sessions") -%}
{% set user = ttrss.get('user', 'ttrss') -%}
{% set group = ttrss.get('group', 'ttrss') -%}
{% set db = ttrss.get('db', {}) -%}
{% set db_user = db.get('user', 'ttrss') -%}
{% set db_pass = db.get('pass', None) -%}
{% set db_db = db.get('db', 'ttrss') -%}
