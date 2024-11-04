
view: view_nilai_edm_madrasah {
  derived_table: {
    sql: SELECT
                'Budaya kedisiplinan bagi madrasah' AS aspek,
                indikator_aspek.kategori_aspek_a AS kategori,
                indikator_aspek.rekomendasi_aspek_a AS rekomendasi,
                CASE
                    WHEN indikator_aspek.kategori_aspek_a IN ('SANGAT BAIK', 'BAIK') THEN
                        'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik'
                    WHEN indikator_aspek.kategori_aspek_a IN ('CUKUP', 'KURANG') THEN
                        'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang'
                    ELSE
                        'Tidak ada simpulan'
                END AS simpulan,
                indikator_aspek.nsm AS nsm,
                indikator_aspek.tahun AS tahun
            FROM `edm.indikator_aspek` AS indikator_aspek

      UNION ALL

      SELECT
      'Budaya melakukan pengembangan diri bagi guru dan tenaga pendidikan' AS aspek,
      indikator_aspek.kategori_aspek_b AS kategori,
      indikator_aspek.rekomendasi_aspek_b AS rekomendasi,
      CASE
      WHEN indikator_aspek.kategori_aspek_b IN ('SANGAT BAIK', 'BAIK') THEN
      'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik'
      WHEN indikator_aspek.kategori_aspek_b IN ('CUKUP', 'KURANG') THEN
      'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang'
      ELSE
      'Tidak ada simpulan'
      END AS simpulan,
      indikator_aspek.nsm AS nsm,
      indikator_aspek.tahun AS tahun
      FROM `edm.indikator_aspek` AS indikator_aspek

      UNION ALL

      SELECT
      'Budaya guru melakukan penyiapan, pelaksanaan dan penilaian atas proses pembelajaran' AS aspek,
      indikator_aspek.kategori_aspek_c AS kategori,
      indikator_aspek.rekomendasi_aspek_c AS rekomendasi,
      CASE
      WHEN indikator_aspek.kategori_aspek_c IN ('SANGAT BAIK', 'BAIK') THEN
      'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik'
      WHEN indikator_aspek.kategori_aspek_c IN ('CUKUP', 'KURANG') THEN
      'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang'
      ELSE
      'Tidak ada simpulan'
      END AS simpulan,
      indikator_aspek.nsm AS nsm,
      indikator_aspek.tahun AS tahun
      FROM `edm.indikator_aspek` AS indikator_aspek

      UNION ALL

      SELECT
      'Budaya madrasah menyediakan sarana belajar untuk guru dan siswa' AS aspek,
      indikator_aspek.kategori_aspek_d AS kategori,
      indikator_aspek.rekomendasi_aspek_d AS rekomendasi,
      CASE
      WHEN indikator_aspek.kategori_aspek_d IN ('SANGAT BAIK', 'BAIK') THEN
      'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik'
      WHEN indikator_aspek.kategori_aspek_d IN ('CUKUP', 'KURANG') THEN
      'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang'
      ELSE
      'Tidak ada simpulan'
      END AS simpulan,
      indikator_aspek.nsm AS nsm,
      indikator_aspek.tahun AS tahun
      FROM `edm.indikator_aspek` AS indikator_aspek

      UNION ALL

      SELECT
      'Budaya madrasah melakukan pengelolaan anggaran yang transparan dan berorientasi pada peningkatan mutu' AS aspek,
      indikator_aspek.kategori_aspek_e AS kategori,
      indikator_aspek.rekomendasi_aspek_e AS rekomendasi,
      CASE
      WHEN indikator_aspek.kategori_aspek_e IN ('SANGAT BAIK', 'BAIK') THEN
      'Madrasah mengalokasikan kegiatan untuk mempertahankan kondisi sangat baik dan baik'
      WHEN indikator_aspek.kategori_aspek_e IN ('CUKUP', 'KURANG') THEN
      'Madrasah mengalokasikan kegiatan untuk memperbaiki kondisi cukup dan kurang'
      ELSE
      'Tidak ada simpulan'
      END AS simpulan,
      indikator_aspek.nsm AS nsm,
      indikator_aspek.tahun AS tahun
      FROM `edm.indikator_aspek` AS indikator_aspek

      ORDER BY kategori ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: aspek {
    type: string
    sql: ${TABLE}.aspek ;;
  }

  dimension: kategori {
    type: string
    sql: ${TABLE}.kategori ;;
  }

  dimension: rekomendasi {
    type: string
    sql: ${TABLE}.rekomendasi ;;
  }

  dimension: simpulan {
    type: string
    sql: ${TABLE}.simpulan ;;
  }

  dimension: nsm {
    type: string
    sql: ${TABLE}.nsm ;;
  }

  dimension: tahun {
    type: string
    sql: ${TABLE}.tahun ;;
  }

  set: detail {
    fields: [
      aspek,
      kategori,
      rekomendasi,
      simpulan,
      nsm,
      tahun
    ]
  }
}
