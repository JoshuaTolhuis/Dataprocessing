rule sorting:
    """
    The sorting rule sorts the trgt vcf and spanning files using samtools and bcftools.

    Input:  vcf files (from previous rule),
            spanning files (from previous rule)
    
    Output: sorted vcf files,
            sorted spanning files
    """
    input:
        vcf = rules.trgt.output.vcf,
        spanning = rules.trgt.output.spanning

    message:
        "Sorts the repeats"

    output:
        sorted_vcf =  f"{DATA_DIR}/sorted/{{sample}}.sorted.vcf.gz",
        sorted_spanning = f"{DATA_DIR}/sorted/{{sample}}.spanning.sorted.bam"

    log:
        f"{DATA_DIR}/logs/{{sample}}.log"


    shell:
        """
        samtools sort -o {output.sorted_spanning} {input.spanning} 2> {log}
        bcftools sort -Ob -o {output.sorted_vcf} {input.vcf} 2> {log}
        """
