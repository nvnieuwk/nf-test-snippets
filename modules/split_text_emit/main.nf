process SPLIT_TEXT_EMIT {
    input:
    tuple val(meta), path(txt)
    val(split_lines)

    output:
    tuple val(meta), path("sub_folder/*.txt"), emit: split

    script:
    """
    mkdir sub_folder/
    split -l $split_lines --additional-suffix ".txt" $txt sub_folder/${meta.id}
    """
}