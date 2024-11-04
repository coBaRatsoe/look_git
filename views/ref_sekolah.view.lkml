# The name of this view in Looker is "Ref Sekolah"
view: ref_sekolah {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `erkam.ref_sekolah` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Jenjang" in Explore.

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: kode_kabkota {
    type: string
    sql: ${TABLE}.kode_kabkota ;;
  }

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: nama_madrasah {
    type: string
    sql: ${TABLE}.nama_madrasah ;;
  }

  dimension: nsm {
    type: string
    sql: ${TABLE}.nsm ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  measure: count {
    type: count
  }
}
