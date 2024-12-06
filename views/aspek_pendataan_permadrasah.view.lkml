# The name of this view in Looker is "Aspek Pendataan Permadrasah"
view: aspek_pendataan_permadrasah {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi-dashboard-dev.report_kinerja_madrasah.aspek_pendataan_permadrasah` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Akreditasi" in Explore.

  dimension: akreditasi {
    type: string
    sql: ${TABLE}.akreditasi ;;
  }

  dimension: alamat_jalan {
    type: string
    sql: ${TABLE}.alamat_jalan ;;
  }

  dimension: avg_student {
    type: number
    sql: ${TABLE}.avg_student ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_student {
    type: sum
    sql: ${avg_student} ;;  }
  measure: average_avg_student {
    type: average
    sql: ${avg_student} ;;  }

  dimension: certification_female_pns {
    type: number
    sql: ${TABLE}.certification_female_pns ;;
  }

  dimension: certification_male_pns {
    type: number
    sql: ${TABLE}.certification_male_pns ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: class_total {
    type: number
    sql: ${TABLE}.class_total ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: guru_s1 {
    type: number
    sql: ${TABLE}.guruS1 ;;
  }

  dimension: gurubersertifikat {
    type: number
    sql: ${TABLE}.gurubersertifikat ;;
  }

  dimension: ijob_no {
    type: string
    sql: ${TABLE}.ijob_no ;;
  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: kode_kabkota {
    type: string
    sql: ${TABLE}.kode_kabkota ;;
  }

  dimension: kode_kecamatan {
    type: string
    sql: ${TABLE}.kode_kecamatan ;;
  }

  dimension: kode_kelurahan {
    type: string
    sql: ${TABLE}.kode_kelurahan ;;
  }

  dimension: kode_pos {
    type: string
    sql: ${TABLE}.kode_pos ;;
  }

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: lab_total {
    type: number
    sql: ${TABLE}.lab_total ;;
  }

  dimension: library_total {
    type: number
    sql: ${TABLE}.library_total ;;
  }

  dimension: nama {
    type: string
    sql: ${TABLE}.nama ;;
  }

  dimension: nama_kamad {
    type: string
    sql: ${TABLE}.nama_kamad ;;
  }

  dimension: npsn {
    type: string
    sql: ${TABLE}.npsn ;;
  }

  dimension: nsm {
    type: string
    sql: ${TABLE}.nsm ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: rasio_lab {
    type: number
    sql: ${TABLE}.rasio_lab ;;
  }

  dimension: rasio_rombelkelas {
    type: number
    sql: ${TABLE}.rasio_rombelkelas ;;
  }

  dimension: rasioguru {
    type: number
    sql: ${TABLE}.rasioguru ;;
  }

  dimension: rasiotoiletsiswa {
    type: number
    sql: ${TABLE}.rasiotoiletsiswa ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: student_female {
    type: number
    sql: ${TABLE}.student_female ;;
  }

  dimension: student_graduation {
    type: number
    sql: ${TABLE}.student_graduation ;;
  }

  dimension: student_male {
    type: number
    sql: ${TABLE}.student_male ;;
  }

  dimension: student_total {
    type: number
    sql: ${TABLE}.student_total ;;
  }

  dimension: teacher_female {
    type: number
    sql: ${TABLE}.teacher_female ;;
  }

  dimension: teacher_male {
    type: number
    sql: ${TABLE}.teacher_male ;;
  }

  dimension: telp {
    type: string
    sql: ${TABLE}.telp ;;
  }

  dimension: toilet_total {
    type: number
    sql: ${TABLE}.toilet_total ;;
  }
  dimension: tahun {
    type: number
    sql: ${TABLE}.tahun ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }
  measure: count {
    type: count
  }

}
