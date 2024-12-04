
view: view_nilai_pendataan_detail_pusat {
  derived_table: {
    sql: select jenjang,round(sum(student_graduation)/count(nsm),2) as total_status_gradution,round(sum(avg_student)/count(nsm),2) as total_rasiosiswa_perrombel,round(sum(rasioguru)/count(nsm),2) as total_rasio_guru,round(sum(gurubersertifikat
      )/count(nsm),2) * 100 as total_gurubersertifikat,round(sum(guruS1)/count(nsm),2)*100 as total_guruS1,round(sum(rasio_rombelkelas)/count(nsm),2) as total_rasio_rombelkelas ,round(sum(rasiotoiletsiswa)/count(nsm),2) as total_rasiotoiletsiswa,round(sum(rasio_lab)/count(nsm),2) as total_rasio_lab,0 as total_history_BAP,round(sum(data_siswa)/count(nsm),2) as total_data_siswa,round(sum(data_guru)/count(nsm),2) as total_data_guru,round(sum(data_sarpras)/count(nsm),2) as total_data_sarpras
       from bi-dashboard-dev.report_kinerja_madrasah.aspek_pendataan_permadrasah 
       group by jenjang ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: total_status_gradution {
    type: number
    sql: ${TABLE}.total_status_gradution ;;
  }

  dimension: total_rasiosiswa_perrombel {
    type: number
    sql: ${TABLE}.total_rasiosiswa_perrombel ;;
  }

  dimension: total_rasio_guru {
    type: number
    sql: ${TABLE}.total_rasio_guru ;;
  }

  dimension: total_gurubersertifikat {
    type: number
    sql: ${TABLE}.total_gurubersertifikat ;;
  }

  dimension: total_guru_s1 {
    type: number
    sql: ${TABLE}.total_guruS1 ;;
  }

  dimension: total_rasio_rombelkelas {
    type: number
    sql: ${TABLE}.total_rasio_rombelkelas ;;
  }

  dimension: total_rasiotoiletsiswa {
    type: number
    sql: ${TABLE}.total_rasiotoiletsiswa ;;
  }

  dimension: total_rasio_lab {
    type: number
    sql: ${TABLE}.total_rasio_lab ;;
  }

  dimension: total_history_bap {
    type: number
    sql: ${TABLE}.total_history_BAP ;;
  }

  dimension: total_data_siswa {
    type: number
    sql: ${TABLE}.total_data_siswa ;;
  }

  dimension: total_data_guru {
    type: number
    sql: ${TABLE}.total_data_guru ;;
  }

  dimension: total_data_sarpras {
    type: number
    sql: ${TABLE}.total_data_sarpras ;;
  }

  set: detail {
    fields: [
        jenjang,
	total_status_gradution,
	total_rasiosiswa_perrombel,
	total_rasio_guru,
	total_gurubersertifikat,
	total_guru_s1,
	total_rasio_rombelkelas,
	total_rasiotoiletsiswa,
	total_rasio_lab,
	total_history_bap,
	total_data_siswa,
	total_data_guru,
	total_data_sarpras
    ]
  }
}
