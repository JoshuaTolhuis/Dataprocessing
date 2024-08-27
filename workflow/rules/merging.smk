rule pbmerge:
    """
    Pbmerge is a rule that merges the HIFI reads and Fail reads.
    It does this using the pbmerge function from the pacbio/anaconda package.

    input:  Hifi reads 
            Fail reads
    output:
            bam file
    """
    input:
        hifi=f"{hifi_dir}/m84036_240201_205955_s2.hifi_reads.{{sample}}.bam",
        fail=f"{fail_dir}/m84036_240201_205955_s2.fail_reads.{{sample}}.bam"

    message:
        "merges the fail and HIFI files"
    
    output:
        f"{DATA_DIR}/merging/{{sample}}.bam"
        
    log:
        f"{DATA_DIR}/logs/{{sample}}.log"
    
    
    shell:
        '''
        pbmerge {input.hifi} {input.fail} >> {output} 2> {log}
        '''
        #pbmerge 1.bam 2.bam 3.bam ... > output.bam

