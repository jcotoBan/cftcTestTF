/**************************/

main_cluster = [
    {
        label : "generic_label"
        k8s_version : "1.26"
        region : "us-southeast"
        pools = [
            {
                type : "g6-standard-2"
                count : 1
            }
        ]
    }
]
