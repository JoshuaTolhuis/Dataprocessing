rule trvz:
    """
    trvz is a rule that uses the trvz function from the pacbio/anaconda package.
    It uses the sorted vcf and sorted spanning files wit the indexed spanning files as indexer to create an .svg.
    A reference genome and known repeats are required to create the image.

    Input:  sorted vcf files (from previous rule),
            sorted spanning files (from previous rule),
            indexed spanning files (from previous rule),
            reference genome file,
            known repeats file

    Output:
        .svg files
    """

    input:
        vcf = rules.sorting.output.sorted_vcf,
        indexed = rules.indexing.output.indexed_spanning,
        spanning = rules.sorting.output.sorted_spanning, # Deze regel is vereist anders wordt indexing niet aangeroepen en crashed trvz.
        reference = f"{DATA_DIR}/{config['genome']}",
        repeats = f"{DATA_DIR}/{config['repeats']}",

    message:
        "creates .svg files of the targeted samples"

    output:
        f"{config['results_directory']}/{{sample}}.svg"

    log:
        f"{DATA_DIR}/logs/{{sample}}.log"

    shell:
        f"trvz --genome {{input.reference}} --repeats {{input.repeats}} --vcf {{input.vcf}} --spanning-reads {{input.spanning}} --repeat-id {config['repeat_id']} --image {{output}}"
