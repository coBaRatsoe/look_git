# The name of this view in Looker is "Edm Status Instrumen"
view: edm_status_instrumen {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `edm.EDM_status_instrumen` ;;
  drill_fields: [nsm]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: nsm {
    primary_key: yes
    type: string
    sql: ${TABLE}.nsm ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Created ETL" in Explore.

  dimension: created_etl {
    type: string
    sql: ${TABLE}.created_etl ;;
  }

  dimension: kabkota {
    type: string
    sql: ${TABLE}.kabkota ;;
  }

  dimension: nama_madrasah {
    type: string
    sql: ${TABLE}.nama_madrasah ;;
  }

  dimension: npsn {
    type: string
    sql: ${TABLE}.npsn ;;
  }

  dimension: provinsi {
    type: string
    sql: ${TABLE}.provinsi ;;
  }

  dimension: status_instrumen {
    type: string
    sql: ${TABLE}.status_instrumen ;;
  }

  dimension: tahun {
    type: string
    sql: ${TABLE}.tahun ;;
  }
  measure: count {
    type: count
    drill_fields: [nsm]
  }
}
