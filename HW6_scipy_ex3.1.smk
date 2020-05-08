SAMPLES = ["A"]

print("Reading file phase.. #start")

rule all:
    input:
        "plot.svg",
        expand("peaks/{sample}.bed", sample = SAMPLES)

rule align:
    input: "reads/{sample}.fq.gz"
    output: "bams/{sample}.bam"
    run:
        print("Executing 'align' rule..")

rule call_peaks:
    input: "bams/{sample}.bam"
    output: "peaks/{sample}.bed"
    script: "scripts/call_peaks.py"

rule plot:
    input:
        expand("peaks/{sample}.bed", sample = SAMPLES)
    output: "plot.svg"
    shell: "echo TODO"

print("Reading file phase.. #end")