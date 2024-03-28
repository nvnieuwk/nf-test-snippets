workflow {
    Channel.fromPath(params.input_txt, checkIfExists:true)
        .map { [ [id:it.baseName], it ] }
        .set { ch_split_input }

    SPLIT_TEXT(
        ch_split_input,
        params.split_lines
    )

    SPLIT_TEXT_EMIT(
        ch_split_input,
        params.split_lines
    )
}

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