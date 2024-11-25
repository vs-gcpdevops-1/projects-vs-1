module "demo-1" {
    source = "./demo"
    name = "my-module-machine"
    machine_type = "e2-medium"

}

module "demo-2" {
    source = "./demo"
    name = "my-module-demo2-machine"
    machine_type = "e2-medium"

}