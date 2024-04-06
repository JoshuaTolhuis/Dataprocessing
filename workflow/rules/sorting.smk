rule sorting:
    input:
        vcf = rules.trgt.output.vcf,
        spanning = rules.trgt.output.spanning

    message:
        "sorts and indexes the targeted repeats"

    output:
        sorted_vcf =  f"{DATA_DIR}/sorted/{{sample}}.sorted.vcf.gz",
        sorted_spanning = f"{DATA_DIR}/sorted/{{sample}}.spanning.sorted.bam"

    shell:
        """
        samtools sort -o {output.sorted_spanning} {input.spanning}
        bcftools sort -Ob -o {output.sorted_vcf} {input.vcf}
        """
