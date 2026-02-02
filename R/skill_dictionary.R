#' Canonical skill dictionary
#'
#' Internal lookup table mapping canonical skill names to a set of
#' keywords and phrases commonly found in job descriptions.
#'
#' This dictionary is used to normalize unstructured job text into
#' consistent, interpretable skill categories.
#'
#' @details
#' This object is internal to the package and not intended to be modified
#' directly by users. It may evolve as new skills emerge in the job market.
#'
#' @keywords internal
canonical_skills <- list(
  
  # ----------------------------
  # Programming Languages
  # ----------------------------
  python = c("python"),
  r = c("\\br\\b", "r language"),
  sql = c("sql"),
  scala = c("scala"),
  javascript = c("javascript"),
  
  # ----------------------------
  # Core Data Science
  # ----------------------------
  statistics = c(
    "statistics", "statistical",
    "hypothesis", "probability",
    "distribution"
  ),
  machine_learning = c("machine learning", "\\bml\\b"),
  data_analysis = c(
    "data analysis",
    "exploratory data", "eda"
  ),
  modeling = c(
    "modeling", "predictive model",
    "regression", "classification"
  ),
  model_evaluation = c(
    "model evaluation", "validation",
    "roc", "confusion matrix",
    "cross validation"
  ),
  experimentation = c(
    "experiment", "a b test",
    "ab test", "hypothesis testing"
  ),
  
  # ----------------------------
  # Advanced ML / AI
  # ----------------------------
  deep_learning = c(
    "deep learning", "neural network"
  ),
  nlp = c(
    "nlp", "natural language",
    "sentiment analysis", "text"
  ),
  recommender_systems = c(
    "recommendation", "recommender"
  ),
  generative_ai = c(
    "generative ai", "llm",
    "large language model", "rag"
  ),
  
  # ----------------------------
  # Data Engineering
  # ----------------------------
  data_pipelines = c(
    "data pipeline", "etl", "pipelines"
  ),
  data_extraction = c(
    "data extraction", "data ingest",
    "data collection", "api"
  ),
  data_cleaning = c(
    "data cleaning", "data preprocessing",
    "data wrangling"
  ),
  databases = c(
    "relational database", "nosql",
    "database"
  ),
  
  # ----------------------------
  # Big Data & Cloud
  # ----------------------------
  cloud = c("aws", "azure", "gcp", "cloud"),
  spark = c("spark"),
  hadoop = c("hadoop"),
  docker = c("docker"),
  kubernetes = c("kubernetes"),
  
  # ----------------------------
  # Visualization & Tools
  # ----------------------------
  data_visualization = c(
    "visualization", "dashboard",
    "reporting"
  ),
  git = c("git", "github"),
  
  # ----------------------------
  # Business / Communication
  # ----------------------------
  communication = c(
    "communication", "stakeholder",
    "presentation", "business"
  ),
  product_thinking = c(
    "product", "customer",
    "business decision"
  )
)
