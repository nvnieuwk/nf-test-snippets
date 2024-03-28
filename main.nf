include { SPLIT_TEXT      } from "./modules/split_text/main"
include { SPLIT_TEXT_EMIT } from "./modules/split_text_emit/main"

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
