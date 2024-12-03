
view: view_gabungan_nilai_akhir {
  derived_table: {
    sql: SELECT
                          aspek_pendataan_permadrasah.nsm as aspek_pendataan_permadrasah_nsm,
                          aspek_pendataan_permadrasah.status as aspek_pendataan_permadrasah_status,
                          aspek_pendataan_permadrasah.kode_provinsi as aspek_pendataan_permadrasah_kode_provinsi,                    
                          --aspek_pendataan_permadrasah.province as nama_provinsi,
                          aspek_pendataan_permadrasah.kode_kabkota as aspek_pendataan_permadrasah_kode_kabkota,
                          --aspek_pendataan_permadrasah.city as nama_kabkota,
                          aspek_pendataan_permadrasah.jenjang as aspek_pendataan_permadrasah_jenjang,
                          round(sum((
                              (CASE WHEN aspek_pendataan_permadrasah.student_graduation = 0 THEN 0 ELSE 1 END) +
                              (CASE WHEN aspek_pendataan_permadrasah.avg_student = 0 THEN 0 ELSE 1 END) +
                              (CASE WHEN aspek_pendataan_permadrasah.rasioguru = 0 THEN 0 ELSE 1 END) +
                              (CASE WHEN aspek_pendataan_permadrasah.gurubersertifikat = 0 THEN 0 ELSE 1 END) +
                              (CASE WHEN aspek_pendataan_permadrasah.guruS1 = 0 THEN 0 ELSE 1 END) +
                              (CASE WHEN aspek_pendataan_permadrasah.rasio_rombelkelas = 0 THEN 0 ELSE 1 END) +
                              (CASE WHEN aspek_pendataan_permadrasah.rasiotoiletsiswa = 0 THEN 0 ELSE 1 END) +
                              (CASE WHEN aspek_pendataan_permadrasah.rasio_lab = 0 THEN 0 ELSE 1 END)
                          )*10)/count(aspek_pendataan_permadrasah.nsm),2) AS view_aspek_pendataan_nilai_akhir_nilai_akhir,
                          round((sum(aspek_tatakelola.avg_lpj + aspek_tatakelola.skor_akhir) / 2)/count(aspek_tatakelola.nsm),2) as view_nilai_akhir_tata_kelola_nilai_akhir_tata_kelola,
                          case when sum(total_row) = 0 then 0 else round(sum(total_skor)/sum(total_row),2) end as view_aspek_guru_nilaiakhir_nilai_akhir_guru,
                          case when sum(total_row_siswa) = 0 then 0 else round(sum(total_skor_siswa)/sum(total_row_siswa),2) end as view_aspek_siswa_nilai_akhir_nilai_akhir_siswa
                      FROM bi-dashboard-dev.report_kinerja_madrasah.aspek_pendataan_permadrasah AS aspek_pendataan_permadrasah
                      left join bi-dashboard-dev.report_kinerja_madrasah.aspek_tatakelola AS aspek_tatakelola on aspek_tatakelola.nsm = aspek_pendataan_permadrasah.nsm and cast(aspek_tatakelola.tahun as integer) = aspek_pendataan_permadrasah.tahun 
                      LEFT join (select tahun,Nsm_Satminkal,sum(avg_skor) as total_skor,count(Nsm_Satminkal) as total_row from bi-dashboard-dev.report_kinerja_madrasah.aspek_guru_permadrasah group by tahun,Nsm_Satminkal)  AS aspek_guru_permadrasah on  cast(aspek_guru_permadrasah.Nsm_Satminkal as string) = aspek_pendataan_permadrasah.nsm and aspek_guru_permadrasah.tahun=aspek_pendataan_permadrasah.tahun
                      left join (select tahun,nsm,sum(skor) as total_skor_siswa,count(nsm) as total_row_siswa
      from bi-dashboard-dev.report_kinerja_madrasah.aspek_siswa_permadrasah group by tahun,nsm ) as aspek_siswa_permadrasah on 
      cast(aspek_siswa_permadrasah.nsm as string) = aspek_pendataan_permadrasah.nsm and aspek_siswa_permadrasah.tahun=aspek_pendataan_permadrasah.tahun
                      group by aspek_pendataan_permadrasah.province,
                          aspek_pendataan_permadrasah.kode_provinsi,
                          aspek_pendataan_permadrasah.kode_kabkota,
                          aspek_pendataan_permadrasah.city,
                          aspek_pendataan_permadrasah.jenjang,
                           aspek_pendataan_permadrasah.nsm,
                           aspek_pendataan_permadrasah.status ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: aspek_pendataan_permadrasah_nsm {
    type: string
    sql: ${TABLE}.aspek_pendataan_permadrasah_nsm ;;
  }

  dimension: aspek_pendataan_permadrasah_status {
    type: string
    sql: ${TABLE}.aspek_pendataan_permadrasah_status ;;
  }

  dimension: aspek_pendataan_permadrasah_kode_provinsi {
    type: string
    sql: ${TABLE}.aspek_pendataan_permadrasah_kode_provinsi ;;
  }

  dimension: aspek_pendataan_permadrasah_kode_kabkota {
    type: string
    sql: ${TABLE}.aspek_pendataan_permadrasah_kode_kabkota ;;
  }

  dimension: aspek_pendataan_permadrasah_jenjang {
    type: string
    sql: ${TABLE}.aspek_pendataan_permadrasah_jenjang ;;
  }

  dimension: view_aspek_pendataan_nilai_akhir_nilai_akhir {
    type: number
    sql: ${TABLE}.view_aspek_pendataan_nilai_akhir_nilai_akhir ;;
  }

  dimension: view_nilai_akhir_tata_kelola_nilai_akhir_tata_kelola {
    type: number
    sql: ${TABLE}.view_nilai_akhir_tata_kelola_nilai_akhir_tata_kelola ;;
  }

  dimension: view_aspek_guru_nilaiakhir_nilai_akhir_guru {
    type: number
    sql: ${TABLE}.view_aspek_guru_nilaiakhir_nilai_akhir_guru ;;
  }

  dimension: view_aspek_siswa_nilai_akhir_nilai_akhir_siswa {
    type: number
    sql: ${TABLE}.view_aspek_siswa_nilai_akhir_nilai_akhir_siswa ;;
  }

  set: detail {
    fields: [
        aspek_pendataan_permadrasah_nsm,
	aspek_pendataan_permadrasah_status,
	aspek_pendataan_permadrasah_kode_provinsi,
	aspek_pendataan_permadrasah_kode_kabkota,
	aspek_pendataan_permadrasah_jenjang,
	view_aspek_pendataan_nilai_akhir_nilai_akhir,
	view_nilai_akhir_tata_kelola_nilai_akhir_tata_kelola,
	view_aspek_guru_nilaiakhir_nilai_akhir_guru,
	view_aspek_siswa_nilai_akhir_nilai_akhir_siswa
    ]
  }
}
