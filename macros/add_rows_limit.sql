{% macro add_rows_limit(number_rows=1000) %}

    {% if var("dev_limit") == true and target.name == 'dev' %}

        limit {{ number_rows }}

    {% endif %}

{% endmacro %}