{% include "tt-rss/vars.sls" with context %}

# database setup
"ttrss_db_user":
  postgres_user.present:
    - name: '{{ ttrss_db_user }}'
    - password: "{{ ttrss_db_pass }}"


"ttrss_db_db":
  postgres_database.present:
    - name: '{{ ttrss_db_db }}'
    - owner: "{{ ttrss_db_user }}"
    - require:
      - postgres_user: "{{ ttrss_db_user }}"
