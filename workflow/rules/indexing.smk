rule indexing:
    """
    Indexing is a rule that uses the sorted_spanning files and sorted vcf files.
    It indexes these using samtools and bcftools, it requires the sorted_vcf to run the indexing.

    input:  sorted_vcf files (from previous rule)
            sorted_spanning files (from previous rule)
    output:
            indexed_spanning files
    """

    input:
        sorted_vcf = rules.sorting.output.sorted_vcf,
        sorted_spanning = rules.sorting.output.sorted_spanning

    message:
        "Indexes the targeted repeats"

    output:
        indexed_spanning = f"{DATA_DIR}/sorted/{{sample}}.spanning.sorted.bam.bai"

    log:
        f"{DATA_DIR}/logs/{{sample}}"

    conda:
        "envs/calling.yaml"
    
    shell:
        """
        samtools index {input.sorted_spanning}
        bcftools index {input.sorted_vcf}
        """