{% import "tt-rss/vars.sls" as ttrss with context %}

# database setup
"ttrss.db_user":
  postgres_user.present:
    - name: '{{ ttrss.db_user }}'
    - password: "{{ ttrss.db_pass }}"


"ttrss.db_db":
  postgres_database.present:
    - name: '{{ ttrss.db_db }}'
    - owner: "{{ ttrss.db_user }}"
    - require:
      - postgres_user: "{{ ttrss.db_user }}"

# for debug varset
# ttrss
#   base = {{ ttrss.base }}
#   app = {{ ttrss.app }}
#   cache = {{ ttrss.cache }}
#   lock = {{ ttrss.lock }}
#   user = {{ ttrss.user }}
#   group = {{ ttrss.group }}
#   db
#     user = {{ ttrss.db_user }}
#     pass = {{ ttrss.db_pass }}
#     db = {{ ttrss.db_db }}
