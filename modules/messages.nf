def help_message() {
  log.info """
        Usage:
        The typical command for running the pipeline is as follows:
        nextflow run main.nf --assemblies "PathToAssembly(ies)" --bakta (or --prokka) --bakta_db --output_dir "PathToOutputDir" --panaroo
	
	or
	
	nextflow run main.nf --gff_input "PathToGFFfiles" --output_dir "PathToOutputDir" --panaroo
	
	or for genome annotation alone
	
	nextflow run main.nf --assemblies "PathToAssembly(ies)" --bakta (or --prokka) --bakta_db --output_dir "PathToOutputDir"
	

        Mandatory arguments:
         --assemblies                   Query genome assembly file(s) to be supplied as input (e.g., "/MIGE/01_DATA/03_ASSEMBLY/T055-8-*.fasta")
         --output_dir                   Output directory to place output reads (e.g., "/MIGE/01_DATA/04_ANNOTATION/")
	 --bakta			must be supplied to run bakta
	 --prokka			must be supplied to run prokka. There is no need to supply the --bakta_db option in this case.
	 --panaroo			must be supplied in any case for pangenome analysis.
         
        Optional arguments:
	 --bakta_db			Path to bakta database if the --bakta option is supplied
	 --gff_input			Path to gff/gff3 file if available. In this case, the --assemblies (and --prokka or --bakta) arguments are no longer necessary.
	 --alignment			Path to filtered alignment file if available. Sole purpose is to use this as an input to construct a phylogenetic tree. 
	                                Therefore, it must be accompanied with --iqtree when supplied.
	 --iqtree			if interested in building a maximum-likelihood phylogenetic tree, this option has to be supplied.
         --help                         This usage statement.
         --version                      Version statement
        """
}



def version_message(String version) {
      println(
            """
            ============================================================================
             GENOME ANNOTATION AND PANGENOME ANALYSIS: TAPIR Pipeline version ${version}
            ============================================================================
            """.stripIndent()
        )

}

def pipeline_start_message(String version, Map params){
    log.info "================================================================================"
    log.info "      GENOME ANNOTATION AND PANGENOME ANALYSIS: TAPIR Pipeline version ${version}            "
    log.info "================================================================================"
    log.info "Running version            : ${version}"
    log.info "Fasta inputs               : ${params.assemblies}"
    log.info "GFF inputs                 : ${params.gff_input}"
    log.info "Filtered alignments        : ${params.alignment}"
    log.info ""
    log.info "-------------------------- Other parameters --------------------------"
    params.sort{ it.key }.each{ k, v ->
        if (v){
            log.info "${k}: ${v}"
        }
    }
    log.info "================================================================================"
    log.info "Outputs written to path '${params.output_dir}'"
    log.info "================================================================================"

    log.info ""
}


def complete_message(Map params, nextflow.script.WorkflowMetadata workflow, String version){
    // Display complete message
    log.info ""
    log.info "Ran the workflow: ${workflow.scriptName} ${version}"
    log.info "Command line    : ${workflow.commandLine}"
    log.info "Completed at    : ${workflow.complete}"
    log.info "Duration        : ${workflow.duration}"
    log.info "Success         : ${workflow.success}"
    log.info "Work directory  : ${workflow.workDir}"
    log.info "Exit status     : ${workflow.exitStatus}"
    log.info ""
}

def error_message(nextflow.script.WorkflowMetadata workflow){
    // Display error message
    log.info ""
    log.info "Workflow execution stopped with the following message:"
    log.info "  " + workflow.errorMessage
}
