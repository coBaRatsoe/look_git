# Define the database connection to be used for this model.
connection: "erkam_test"
connection: "akg2024"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: rapor_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rapor_project_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Rapor Project"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.
explore: aspek_pendataan_permadrasah {}
explore: aspek_tatakelola {}
explore: aspek_guru_permadrasah {
  join: aspek_pendataan_permadrasah {
    relationship: many_to_one
    sql_on: ${CAST (aspek_guru_permadrasah.nsm_satminkal AS STRING)} = ${aspek_pendataan_permadrasah.nsm} ;;
  }
}
explore: view_nilai_akhir_tata_kelola {}
explore: view_aspek_guru_nilaiakhir {}
explore: view_aspek_pendataan_nilai_akhir {
  join: view_nilai_akhir_tata_kelola {
    relationship: many_to_one
    sql_on: ${view_aspek_pendataan_nilai_akhir.nsm} = ${view_nilai_akhir_tata_kelola.aspek_tatakelola_nsm} ;;
  }
  join: view_aspek_guru_nilaiakhir {
    relationship: many_to_one
    sql_on:${view_aspek_pendataan_nilai_akhir.nsm} = ${view_aspek_guru_nilaiakhir.aspek_guru_permadrasah_nsm_satminkal} ;;
  }
  join: aspek_pendataan_permadrasah {
    relationship: many_to_one
    sql_on: ${aspek_pendataan_permadrasah.nsm} = ${view_aspek_pendataan_nilai_akhir.nsm} ;;
  }
}
explore: view_nilai_provinsi {}
explore: view_nilai_akhir_kabkota {}
explore: view_nilai_tatakelola_detail_perprovinsi {}
explore: view_nilai_tatakelola_detail_perkabkota {}
explore: nsp_test {}

explore: ref_komponen {}

explore: erkam_realization_summarize {}

explore: ref_sekolah {}

explore: erkam_planning_summarize_copy {}

explore: ref_kegiatan_mappingjuknis {}

explore: erkam_planning_summarize {}

explore: erkam_raw_data {}

explore: ref_snp {}

explore: vw_mart_summary_perkomponen {}

explore: vw_reportapbm_graph_akb_planning_permadrasah {}

explore: ref_sekolah_copy {}

explore: vw_reportapbm_graph_snp_perkabkota {}

explore: vw_reportapbm_graph_akb_realization_permadrasah {}

explore: vw_reportapbm_graph_snp_perprovinsi {}

explore: vw_reportapbm_graph_snp_permadrasah {}

explore: vw_reportapbm_header_planning_perprovinsi {}

explore: vw_reportapbm_header_planning_perkabkota {}

explore: vw_reportapbm_header_realization_permadrasah {}

explore: vw_summary_perkegiatan_detail_satuan {}

explore: vw_reportapbm_header_realization_perprovinsi {}

explore: vw_reportapbm_header_realization_perkabkota {}

explore: vw_summary_rencanarealisasi_perkabkota {}

explore: vw_reportapbm_header_planning_permadrasah {}

explore: vw_summary_rencanarealisasi_perprovinsi {}

explore: vw_summary_rencanarealisasi_pernsm {}
