rule pbmerge:
    input:
        hifi=f"{hifi_dir}/m84036_240201_205955_s2.hifi_reads.{{sample}}.bam",
        fail=f"{fail_dir}/m84036_240201_205955_s2.fail_reads.{{sample}}.bam"
    output:
        f"{DATA_DIR}/merging/{{sample}}.bam"
    message:
        "merges the fail and HIFI files"
    shell:
        "pbmerge {input.hifi} {input.fail} > {output}"
        # pbmerge 1.bam 2.bam 3.bam ... > output.bam

