rule trvz:
    input:
        vcf = rules.indexing.output.indexed_vcf,
        spanning = rules.sorting.output.sorted_spanning,
        reference = f"{DATA_DIR}/{config['genome']}",
        repeats = f"{DATA_DIR}/{config['repeats']}",
    message:
        "creates .svg files of the targeted samples"

    output:
        f"{config['results_directory']}/{{sample}}.svg"

    params:
        repeat_id = "DMPK"

    shell:
        "trvz --genome {input.reference} --repeats {input.repeats} --vcf {input.vcf} --spanning-reads {input.spanning} --repeat-id {params.repeat_id} --image {output}"
