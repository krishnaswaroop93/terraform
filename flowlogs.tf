resource "aws_s3_bucket" "flowlogs-bucket"{
    bucket = "devopsb14delete"
    lifecycle  {
        create_before_destroy = true
        prevent_destory = true
    }
}

resource "aws_flow_log"  "example" {
    log_distination = aws_s3_bucket.flowlogs-bucket.arn
    log_distination = "s3"
    traffic_type    = "All"
    vpc_id          = aws_vpc.default.id
}