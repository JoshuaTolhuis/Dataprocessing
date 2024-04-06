rule indexing:
    input:
        sorted_vcf = rules.sorting.output.sorted_vcf,
        sorted_spanning = rules.sorting.output.sorted_spanning

    message:
        "sorts and indexes the targeted repeats"

    output:
        indexed_vcf =  f"{DATA_DIR}/sorted/{{sample}}.sorted.vcf.gz",
        indexed_spanning = f"{DATA_DIR}/sorted/{{sample}}.spanning.sorted.bam.bai"

    shell:
        """
        samtools index {input.sorted_spanning}
        bcftools index {input.sorted_vcf}
        """