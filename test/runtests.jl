using Test
using GDriveDownload

@testset "GDriveDownload tests" begin
    doc_ids = ["1y8Iq8TVcPdyTYhQKwWIv5CnfjX8Yk2Kz"]
    output_dir = "./users/BOTRUN_USER_NAME/data/"

    try
        GDriveDownload.download_files(doc_ids, output_dir)
        @test true  # 如果上面的函數呼叫未擲出任何異常，則此測試會通過
    catch e
        @test false  # 如果上面的函數呼叫擲出異常，則此測試會失敗
    end
end
