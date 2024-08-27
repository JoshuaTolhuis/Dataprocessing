rule pbmm2_align:
    """
    Pbbm2_allign is a rule that uses the pbbm2 function of the pacbio/conda package.
    It aligns the demultiplexed files against a reference genome.

    input:  reference genome,
            merged files (from previous rule)
    output: aligned .bam file
    """

    message:
        "aligning the demuxed files"

    input:
        reference = f"{DATA_DIR}/{config['genome']}",
        query = rules.pbmerge.output

    output:
        f"{DATA_DIR}/aligned/{{sample}}.aligned.bam"
        
    log:
        f"{DATA_DIR}/aligned/{{sample}}.log"

    #params:
    #    preset="CCS", # SUBREAD, CCS, HIFI, ISOSEQ, UNROLLED
    #    sample="", # sample name for @RG header
    #    extra="--sort", # optional additional args
    #    loglevel="INFO"    

    #conda:
    #    "../envs/pbmm2_align.yaml"

    #wrapper:
    #    "v1.14.99/bio/pbmm2/align"

    shell:
        f"pbmm2 align {{input.reference}} {{input.query}} {{output}} --sort -j {config['threads']} -J {config['sort_threads']} 2> {{log}}"
