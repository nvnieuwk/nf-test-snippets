process SPLIT_TEXT {
    input:
    tuple val(meta), path(txt)
    val(split_lines)

    output:
    tuple val(meta), path("*.txt")

    script:
    """
    split -l $split_lines --additional-suffix ".txt" $txt ${meta.id}
    """
}