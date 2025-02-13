{# Generic macro to get a column name and table,
    outputs the distinct fields of the given column name #}
{% macro get_column_values(column_name, table_name) %}
    {% set relation_query %}
    select
        distinct {{ column_name }}
    from {{ table_name }}
    order by payment_type
    {% endset %}

    {% set results = run_query(relation_query) %}

    {% if execute %}
    {# return the first column #}
    {% set results_list = results.columns[0].values() %}
    {% else %}
    {% set results_list = [] %}
    {% endif %}

    {{ return(results_list) }}
{% endmacro %}

{# Macro to get the distinct payment types #}
{% macro get_payment_types() %}
    {{ return(get_column_values('payment_type', ref("stg_stripe_order_payments"))) }}
{% endmacro%}

{# Macro to get the distinct payment methods#}
{% macro get_payment_method() %}
    {{ return(get_column_values('payment_method', ref("stg_stripe_order_payments"))) }}
{% endmacro %}