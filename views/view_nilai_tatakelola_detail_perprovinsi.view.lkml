
view: view_nilai_tatakelola_detail_perprovinsi {
  derived_table: {
    sql: SELECT tahun,kode_provinsi,provinsi,jenjang, aspek_a,aspek_b,aspek_c,aspek_d,aspek_e,avg_lpj,
              CASE
                    WHEN aspek_a <=40  THEN
                        'KURANG' ELSE
                    CASE WHEN aspek_a >40 AND aspek_a <=60 THEN
                        'CUKUP' ELSE
                    CASE WHEN aspek_a >60 AND aspek_a <=80 THEN
                        'BAIK' ELSE
                    CASE WHEN aspek_a >80 THEN
                        'SANGAT BAIK' END END END
                END AS hasil_penilaian_a,
                CASE
                    WHEN aspek_b <=40  THEN
                        'KURANG' ELSE
                    CASE WHEN aspek_b >40 AND aspek_b <=60 THEN
                        'CUKUP' ELSE
                    CASE WHEN aspek_b >60 AND aspek_b <=80 THEN
                        'BAIK' ELSE
                    CASE WHEN aspek_b >80 THEN
                        'SANGAT BAIK' END END END
                END AS hasil_penilaian_b,
                CASE
                    WHEN aspek_c <=40  THEN
                        'KURANG' ELSE
                    CASE WHEN aspek_c >40 AND aspek_c <=60 THEN
                        'CUKUP' ELSE
                    CASE WHEN aspek_c >60 AND aspek_c <=80 THEN
                        'BAIK' ELSE
                    CASE WHEN aspek_c >80 THEN
                        'SANGAT BAIK' END END END
                END AS hasil_penilaian_c,
                CASE
                    WHEN aspek_d <=40  THEN
                        'KURANG' ELSE
                    CASE WHEN aspek_d >40 AND aspek_d <=60 THEN
                        'CUKUP' ELSE
                    CASE WHEN aspek_d >60 AND aspek_d <=80 THEN
                        'BAIK' ELSE
                    CASE WHEN aspek_d >80 THEN
                        'SANGAT BAIK' END END END
                END AS hasil_penilaian_d,
                CASE
                    WHEN aspek_e <=40  THEN
                        'KURANG' ELSE
                    CASE WHEN aspek_e >40 AND aspek_e <=60 THEN
                        'CUKUP' ELSE
                    CASE WHEN aspek_e >60 AND aspek_e <=80 THEN
                        'BAIK' ELSE
                    CASE WHEN aspek_e >80 THEN
                        'SANGAT BAIK' END END END
                END AS hasil_penilaian_e,
                CASE
                    WHEN aspek_a >60   THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik' ELSE
                    CASE WHEN aspek_a <=60 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang' END
                END AS rekomendasi_penilaian_a,
                CASE
                    WHEN aspek_b >60   THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik' ELSE
                    CASE WHEN aspek_b <=60 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang' END
                END AS rekomendasi_penilaian_b,
                CASE
                    WHEN aspek_c >60  THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik' ELSE
                    CASE WHEN aspek_c <=60 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang' END
                END AS rekomendasi_penilaian_c,
                CASE
                    WHEN aspek_d >60   THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik' ELSE
                    CASE WHEN aspek_d <=60 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang' END
                END AS rekomendasi_penilaian_d,
                CASE
                    WHEN aspek_e >60   THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik' ELSE
                    CASE WHEN aspek_e <=60 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang' END
                END AS rekomendasi_penilaian_e,
                CASE
                    WHEN avg_lpj <=50   THEN
                        'Tidak Tepat Waktu' ELSE
                    CASE WHEN avg_lpj >50 THEN
                        'Tepat Waktu' END
                END AS hasil_penilaian_lpj,
                CASE
                    WHEN avg_lpj >50   THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi pelaporan LPJ agar tetap Tepat Waktu' ELSE
                    CASE WHEN avg_lpj <=50 THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi pelaporan LPJ' END
                END AS rekomendasi_lpj

      FROM (
      SELECT
          aspek_tatakelola.tahun AS tahun,
          aspek_tatakelola.kode_provinsi  AS kode_provinsi,
          aspek_tatakelola.provinsi  AS provinsi,
          aspek_tatakelola.jenjang  AS jenjang,
          ROUND (SUM (aspek_tatakelola.aspek_a) / COUNT (aspek_tatakelola.nsm),2)  AS aspek_a,
          ROUND (SUM (aspek_tatakelola.aspek_b) / COUNT (aspek_tatakelola.nsm),2)  AS aspek_b,
          ROUND (SUM (aspek_tatakelola.aspek_c) / COUNT (aspek_tatakelola.nsm),2)  AS aspek_c,
          ROUND (SUM (aspek_tatakelola.aspek_d) / COUNT (aspek_tatakelola.nsm),2)  AS aspek_d,
          ROUND (SUM (aspek_tatakelola.aspek_e) / COUNT (aspek_tatakelola.nsm),2)  AS aspek_e,
          ROUND (SUM (aspek_tatakelola.avg_lpj) / COUNT (aspek_tatakelola.nsm),2) AS avg_lpj
      FROM `bi-dashboard-dev.report_kinerja_madrasah.aspek_tatakelola`  AS aspek_tatakelola
      GROUP BY
          1,
          2,
          3,
          4
      ) as Nilai_aspek ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: kode_provinsi {
    type: string
    sql: ${TABLE}.kode_provinsi ;;
  }

  dimension: provinsi {
    type: string
    sql: ${TABLE}.provinsi ;;
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
  dimension: avg_lpj {
    type: string
    sql: ${TABLE}.avg_lpj ;;
  }
  dimension: hasil_penilaian_lpj {
    type: string
    sql: ${TABLE}.hasil_penilaian_lpj ;;
  }
  dimension: rekomendasi_lpj {
    type: string
    sql: ${TABLE}.rekomendasi_lpj ;;
  }
  dimension: tahun {
    type: string
    sql: ${TABLE}.tahun ;;
  }

  set: detail {
    fields: [
        kode_provinsi,
  provinsi,
  jenjang,
  aspek_a,
  aspek_b,
  aspek_c,
  aspek_d,
  aspek_e,
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
  avg_lpj,
  hasil_penilaian_lpj,
  rekomendasi_lpj
    ]
  }
}
