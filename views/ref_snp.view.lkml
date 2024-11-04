# The name of this view in Looker is "Ref Snp"
view: ref_snp {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.ref_snp` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Created At" in Explore.

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: kode {
    type: string
    sql: ${TABLE}.kode ;;
  }

  dimension: nama {
    type: string
    sql: ${TABLE}.nama ;;
  }

  dimension: tahun {
    type: string
    sql: ${TABLE}.tahun ;;
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
  }
  measure: count {
    type: count
  }
}
