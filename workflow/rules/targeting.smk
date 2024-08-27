rule trgt:
    """
    trgt is a rule that uses the trgt function from the pacbio/anaconda pacakge.
    It uses a reference genome and a know repeats file tot target the repeats on the aligned and merged HIFI/FAIL reads.

    input:  aligned & merged HIFI/FAIL reads (from previous rules),
            reference genome file
            known repeats file

    output: vcf files,
            spanning files
    """

    input:
        aligned = rules.pbmm2_align.output,      
        reference = f"{DATA_DIR}/{config['genome']}",
        repeats = f"{DATA_DIR}/{config['repeats']}"

    message:
        "targets the repeats"

    output:
        vcf = f"{DATA_DIR}/aligned/{{sample}}.vcf.gz",
        spanning = f"{DATA_DIR}/aligned/{{sample}}.spanning.bam"

    params:
        repeat_id = "DMPK"

    log:
        f"{DATA_DIR}/logs/{{sample}}.log"

    shell:
        f"trgt --threads {config['trgt_threads']} --genome {{input.reference}} --reads {{input.aligned}} --repeats {{input.repeats}} --output-prefix {DATA_DIR}/aligned/{{wildcards.sample}} 2> {{log}}"
