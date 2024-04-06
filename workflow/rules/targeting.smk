rule trgt:
    input:
        aligned = rules.pbmm2_align.output,      
        reference = f"{DATA_DIR}/{config['genome']}",
        repeats = f"{DATA_DIR}/{config['repeats']}"
    message:
        "targets the repeats"
    output:
        vcf = f"{DATA_DIR}/aligned/{{sample}}.vcf.gz",
        spanning = f"{DATA_DIR}/aligned/{{sample}}.spanning.bam"
    threads:
        12
    shell:
        "trgt --threads {threads} --genome {input.reference} --reads {input.aligned} --repeats {input.repeats} --output-prefix " + f" {DATA_DIR}/aligned/{{wildcards.sample}}"
