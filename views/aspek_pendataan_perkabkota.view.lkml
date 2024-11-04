# The name of this view in Looker is "Aspek Pendataan Perkabkota"
view: aspek_pendataan_perkabkota {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi-dashboard-dev.report_kinerja_madrasah.aspek_pendataan_perkabkota` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Avg Student Perrombel" in Explore.

  dimension: avg_student_perrombel {
    type: number
    sql: ${TABLE}.avg_student_perrombel ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_student_perrombel {
    type: sum
    sql: ${avg_student_perrombel} ;;  }
  measure: average_avg_student_perrombel {
    type: average
    sql: ${avg_student_perrombel} ;;  }

  dimension: kode_kabkota {
    type: string
    sql: ${TABLE}.kode_kabkota ;;
  }

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: nama_kabkota {
    type: string
    sql: ${TABLE}.nama_kabkota ;;
  }

  dimension: nama_provinsi {
    type: string
    sql: ${TABLE}.nama_provinsi ;;
  }
  measure: count {
    type: count
  }
}
