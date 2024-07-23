{% macro learn_variables() %}


{% set name_jinja = "Ican" %}

{{ log("Irene loves " ~ name_jinja, info=True )}}

{{ log("Hello dbt user " ~ var("user_name"), info=True)}}


{% endmacro %}