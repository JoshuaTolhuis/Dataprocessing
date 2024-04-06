rule pbmm2_align:
    input:
        merged = rules.pbmerge.output,
        reference = f"{DATA_DIR}/{config['genome']}"
    message:
        "aligning the demuxed files"
    output:
        f"{DATA_DIR}/aligned/{{sample}}.aligned.bam"
    threads: 
        2
    shell:
        "pbmm2 align {input.reference} {input.merged} {output} --sort -j 12 -J {threads}"
