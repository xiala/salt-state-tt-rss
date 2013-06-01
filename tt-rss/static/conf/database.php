<?php
{% import "tt-rss/vars.sls" as ttrss with context %}
{% set db = salt['pillar.get']('tt-rss:db', {}) %}
$dbuser='{{ db.get('user', 'ttrss') }};
$dbpass='{{ db.get('pass', None) }}';
$basepath='{{ db.get('pass', '') }}';
$dbname='{{ db.get('pass', 'ttrss') }}';
$dbserver='{{ db.get('pass', '') }}';
$dbport='{{ db.get('pass', '' }}';
$dbtype='{{ db.get('pass', 'pgsql' }}';

?>
