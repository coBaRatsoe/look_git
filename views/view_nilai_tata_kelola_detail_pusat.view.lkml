
view: view_nilai_tata_kelola_detail_pusat {
  derived_table: {
    sql: SELECT jenjang, aspek_a,aspek_b,aspek_c,aspek_d,aspek_e,avg_lpj,
                    CASE
                    WHEN aspek_a BETWEEN 0 AND 40  THEN
                        'KURANG' ELSE
                    CASE WHEN aspek_a BETWEEN 41 AND 60 THEN
                        'CUKUP' ELSE
                    CASE WHEN aspek_a BETWEEN 61 AND 80 THEN
                        'BAIK' ELSE
                    CASE WHEN aspek_a BETWEEN 81 AND 100 THEN
                        'SANGAT BAIK' END END END
                END AS hasil_penilaian_a,
                CASE
                    WHEN aspek_b BETWEEN 0 AND 40  THEN
                        'KURANG' ELSE
                    CASE WHEN aspek_b BETWEEN 41 AND 60 THEN
                        'CUKUP' ELSE
                    CASE WHEN aspek_b BETWEEN 61 AND 80 THEN
                        'BAIK' ELSE
                    CASE WHEN aspek_b BETWEEN 81 AND 100 THEN
                        'SANGAT BAIK' END END END
                END AS hasil_penilaian_b,
                CASE
                    WHEN aspek_c BETWEEN 0 AND 40  THEN
                        'KURANG' ELSE
                    CASE WHEN aspek_c BETWEEN 41 AND 60 THEN
                        'CUKUP' ELSE
                    CASE WHEN aspek_c BETWEEN 61 AND 80 THEN
                        'BAIK' ELSE
                    CASE WHEN aspek_c BETWEEN 81 AND 100 THEN
                        'SANGAT BAIK' END END END
                END AS hasil_penilaian_c,
                CASE
                    WHEN aspek_d BETWEEN 0 AND 40  THEN
                        'KURANG' ELSE
                    CASE WHEN aspek_d BETWEEN 41 AND 60 THEN
                        'CUKUP' ELSE
                    CASE WHEN aspek_d BETWEEN 61 AND 80 THEN
                        'BAIK' ELSE
                    CASE WHEN aspek_d BETWEEN 81 AND 100 THEN
                        'SANGAT BAIK' END END END
                END AS hasil_penilaian_d,
                CASE
                    WHEN aspek_e BETWEEN 0 AND 40  THEN
                        'KURANG' ELSE
                    CASE WHEN aspek_e BETWEEN 41 AND 60 THEN
                        'CUKUP' ELSE
                    CASE WHEN aspek_e BETWEEN 61 AND 80 THEN
                        'BAIK' ELSE
                    CASE WHEN aspek_e BETWEEN 81 AND 100 THEN
                        'SANGAT BAIK' END END END
                END AS hasil_penilaian_e,
                CASE
                    WHEN aspek_a BETWEEN 61 AND 100   THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik' ELSE
                    CASE WHEN aspek_a BETWEEN 0 AND 60 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang' END
                END AS rekomendasi_penilaian_a,
                CASE
                    WHEN aspek_b BETWEEN 61 AND 100   THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik' ELSE
                    CASE WHEN aspek_b BETWEEN 0 AND 60 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang' END
                END AS rekomendasi_penilaian_b,
                CASE
                    WHEN aspek_c BETWEEN 61 AND 100   THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik' ELSE
                    CASE WHEN aspek_c BETWEEN 0 AND 60 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang' END
                END AS rekomendasi_penilaian_c,
                CASE
                    WHEN aspek_d BETWEEN 61 AND 100   THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik' ELSE
                    CASE WHEN aspek_d BETWEEN 0 AND 60 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang' END
                END AS rekomendasi_penilaian_d,
                CASE
                    WHEN aspek_e BETWEEN 61 AND 100   THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik' ELSE
                    CASE WHEN aspek_e BETWEEN 0 AND 60 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang' END
                END AS rekomendasi_penilaian_e,
                CASE
                    WHEN avg_lpj BETWEEN 0 AND 50   THEN
                        'Tidak Tepat Waktu' ELSE
                    CASE WHEN avg_lpj BETWEEN 51 AND 100 THEN
                        'Tepat Waktu' END
                END AS hasil_penilaian_lpj,
                CASE
                    WHEN avg_lpj BETWEEN 61 AND 100   THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi pelaporan LPJ agar tetap Tepat Waktu' ELSE
                    CASE WHEN avg_lpj BETWEEN 0 AND 60 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi pelaporan LPJ' END
                END AS rekomendasi_lpj
      
            FROM (
            SELECT
                aspek_tatakelola.jenjang  AS jenjang,
                ROUND (SUM (aspek_tatakelola.aspek_a) / COUNT (aspek_tatakelola.nsm),2)  AS aspek_a,
                ROUND (SUM (aspek_tatakelola.aspek_b) / COUNT (aspek_tatakelola.nsm),2)  AS aspek_b,
                ROUND (SUM (aspek_tatakelola.aspek_c) / COUNT (aspek_tatakelola.nsm),2)  AS aspek_c,
                ROUND (SUM (aspek_tatakelola.aspek_d) / COUNT (aspek_tatakelola.nsm),2)  AS aspek_d,
                ROUND (SUM (aspek_tatakelola.aspek_e) / COUNT (aspek_tatakelola.nsm),2)  AS aspek_e,
                ROUND (SUM (aspek_tatakelola.avg_lpj) / COUNT (aspek_tatakelola.nsm),2) AS avg_lpj
            FROM `bi-dashboard-dev.report_kinerja_madrasah.aspek_tatakelola`  AS aspek_tatakelola
            GROUP BY
                1
            ) as Nilai_aspek ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: jenjang {
    type: string
    sql: ${TABLE}.jenjang ;;
  }

  dimension: aspek_a {
    type: number
    sql: ${TABLE}.aspek_a ;;
  }

  dimension: aspek_b {
    type: number
    sql: ${TABLE}.aspek_b ;;
  }

  dimension: aspek_c {
    type: number
    sql: ${TABLE}.aspek_c ;;
  }

  dimension: aspek_d {
    type: number
    sql: ${TABLE}.aspek_d ;;
  }

  dimension: aspek_e {
    type: number
    sql: ${TABLE}.aspek_e ;;
  }

  dimension: avg_lpj {
    type: number
    sql: ${TABLE}.avg_lpj ;;
  }

  dimension: hasil_penilaian_a {
    type: string
    sql: ${TABLE}.hasil_penilaian_a ;;
  }

  dimension: hasil_penilaian_b {
    type: string
    sql: ${TABLE}.hasil_penilaian_b ;;
  }

  dimension: hasil_penilaian_c {
    type: string
    sql: ${TABLE}.hasil_penilaian_c ;;
  }

  dimension: hasil_penilaian_d {
    type: string
    sql: ${TABLE}.hasil_penilaian_d ;;
  }

  dimension: hasil_penilaian_e {
    type: string
    sql: ${TABLE}.hasil_penilaian_e ;;
  }

  dimension: rekomendasi_penilaian_a {
    type: string
    sql: ${TABLE}.rekomendasi_penilaian_a ;;
  }

  dimension: rekomendasi_penilaian_b {
    type: string
    sql: ${TABLE}.rekomendasi_penilaian_b ;;
  }

  dimension: rekomendasi_penilaian_c {
    type: string
    sql: ${TABLE}.rekomendasi_penilaian_c ;;
  }

  dimension: rekomendasi_penilaian_d {
    type: string
    sql: ${TABLE}.rekomendasi_penilaian_d ;;
  }

  dimension: rekomendasi_penilaian_e {
    type: string
    sql: ${TABLE}.rekomendasi_penilaian_e ;;
  }

  dimension: hasil_penilaian_lpj {
    type: string
    sql: ${TABLE}.hasil_penilaian_lpj ;;
  }

  dimension: rekomendasi_lpj {
    type: string
    sql: ${TABLE}.rekomendasi_lpj ;;
  }

  set: detail {
    fields: [
        jenjang,
	aspek_a,
	aspek_b,
	aspek_c,
	aspek_d,
	aspek_e,
	avg_lpj,
	hasil_penilaian_a,
	hasil_penilaian_b,
	hasil_penilaian_c,
	hasil_penilaian_d,
	hasil_penilaian_e,
	rekomendasi_penilaian_a,
	rekomendasi_penilaian_b,
	rekomendasi_penilaian_c,
	rekomendasi_penilaian_d,
	rekomendasi_penilaian_e,
	hasil_penilaian_lpj,
	rekomendasi_lpj
    ]
  }
}
