process UPPERCASE {
    input:
    tuple val(meta), path(txt)

    output:
    tuple val(meta), path("*.txt"), emit: uppercase

    script:
    """
    <$txt tr '[:lower:]' '[:upper:]' >${meta.id}_uppercase.txt
    """
}