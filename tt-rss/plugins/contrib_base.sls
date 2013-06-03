
"{{ ttrss.app }}/plugins/{{ name }}":
  file.symlink:
    - target: "{{ ttrss.contrib }}/plugins/{{ name }}"
