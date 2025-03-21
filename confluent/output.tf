resource "null_resource" "default_output" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "" >> outputs.txt
      echo "# Confluent Cloud" > outputs.txt
      echo "CC_ENV_NAME='${confluent_environment.default.display_name}'" >> outputs.txt
      echo "CC_CLUSTER_NAME='${confluent_kafka_cluster.default.display_name}'" >> outputs.txt 
      echo "CC_CLUSTER_ID='${confluent_kafka_cluster.default.display_name}'" >> outputs.txt 
      echo "" >> outputs.txt
      echo "# Confluent Kafka" >> outputs.txt
      echo "CC_CLUSTER_API_KEY='${confluent_api_key.cluster-api-key.id}'" >> outputs.txt
      echo "CC_CLUSTER_API_SECRET='${confluent_api_key.cluster-api-key.secret}'" >> outputs.txt
      echo "CC_CLUSTER_KAFKA_URL='${replace(confluent_kafka_cluster.default.bootstrap_endpoint, "SASL_SSL://", "")}'" >> outputs.txt
      echo "CC_KAFKA_RAW_NEWS_TOPIC='${confluent_kafka_topic.ContextRaw.topic_name}'" >> outputs.txt
      echo "CC_KAFKA_EMBEDDING_NEWS_TOPIC='${confluent_kafka_topic.ContextEmbedding.topic_name}'" >> outputs.txt
      echo "CC_KAFKA_RAW_PROMPT_TOPIC='${confluent_kafka_topic.PromptRaw.topic_name}'" >> outputs.txt
      echo "CC_KAFKA_PROMPT_CONTEXTINDEX_TOPIC='${confluent_kafka_topic.PromptContextIndex.topic_name}'" >> outputs.txt
      echo "CC_KAFKA_PROMPT_ENRICHED_TOPIC='EnhancedPromptContextJoin'" >> outputs.txt
      echo "" >> outputs.txt
      echo "# Confluent Schema Registry" >> outputs.txt
      echo "CC_CLUSTER_SR_URL='${replace(confluent_schema_registry_cluster.default.rest_endpoint, "https://", "")}'" >> outputs.txt
      echo "CC_CLUSTER_SR_USER='${confluent_api_key.schema-registry-api-key.id}'" >> outputs.txt
      echo "CC_CLUSTER_SR_PASS='${confluent_api_key.schema-registry-api-key.secret}'" >> outputs.txt
      echo "" >> outputs.txt
      echo "# Confluent Flink" >> outputs.txt
      echo "CC_FLINK_COMPUTE_POOL_NAME='${confluent_flink_compute_pool.default.display_name}'" >> outputs.txt
      echo "CC_FLINK_COMPUTE_POOL_ID='${confluent_flink_compute_pool.default.id}'" >> outputs.txt
      echo "" >> outputs.txt
      echo "# MongoDB Atlas" >> outputs.txt
      echo "MONGO_CLUSTER_SERVER_URL='${mongodbatlas_cluster.default.connection_strings[0].standard_srv}'" >> outputs.txt
      echo "MONGO_CLUSTER_REPLICAS='${mongodbatlas_cluster.default.connection_strings[0].standard}'" >> outputs.txt
      echo "MONGO_DATABASE_USER='${local.mongo_workshop_database_user}'" >> outputs.txt
      echo "MONGO_DATABASE_PASSWORD='${local.mongo_workshop_database_pass}'" >> outputs.txt
      echo "MONGO_DATABASE_INDEX='${local.mongo_workshop_database_index}'" >> outputs.txt
      echo "MONGO_DATABASE='${local.mongo_workshop_database}'" >> outputs.txt
      echo "MONGO_COLLECTION='${local.mongo_workshop_database_collection}'" >> outputs.txt
      echo "" >> outputs.txt
      echo "# External APIs" >> outputs.txt
      echo "OPENAI_APIKEY='${var.openai_api_key}'" >> outputs.txt
      echo "NEWSAPI_APIKEY='${var.newsapi_api_key}'" >> outputs.txt
    EOT
  }
}