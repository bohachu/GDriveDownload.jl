module GDriveDownload
export download_files

function download_files(doc_ids::Array{String,1}, output_dir::String)
    for doc_id in doc_ids
        cmd = "wget -q --load-cookies /tmp/cookies.txt \"https://docs.google.com/uc?export=download&confirm=" *
              "\$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate " *
              "'https://docs.google.com/uc?export=download&id=$(doc_id)' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\\\\1\\\\n/p')" *
              "&id=$(doc_id)\" -O $(joinpath(output_dir, "$(doc_id).zip")) && rm -rf /tmp/cookies.txt"

        # Create the output directory if it does not exist
        if !isdir(output_dir)
            mkpath(output_dir)
        end

        run(`bash -c $cmd`)
        println("File $(doc_id) has been successfully downloaded.")
    end
end

end # module
