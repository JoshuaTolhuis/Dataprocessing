rule pbmm2_align:
    """
    Pbbm2_allign is a rule that uses the pbbm2 function of the pacbio/conda package.
    It aligns the demultiplexed files against a reference genome.

    input:  reference genome,
            merged files (from previous rule)
    output: aligned .bam file
    """

    input:
        merged = rules.pbmerge.output,
        reference = f"{DATA_DIR}/{config['genome']}"

    message:
        "aligning the demuxed files"

    output:
        f"{DATA_DIR}/aligned/{{sample}}.aligned.bam"

    threads: 
        2

    log:
        f"{DATA_DIR}/logs/{{sample}}.log"
        
    shell:
        "pbmm2 align {input.reference} {input.merged} {output} --sort -j 12 -J {threads}"
