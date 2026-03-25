# Homebrew Tap for Weave CLI

AI-powered CLI for managing vector databases. Supports 12+ VDB
providers including Weaviate, Qdrant, Milvus, Redis, Chroma,
Supabase, MongoDB, Neo4j, Pinecone, OpenSearch, and Elasticsearch.

## Install

```bash
brew install Maximilien-ai/weave-cli/weave-cli
```

Or tap first, then install:

```bash
brew tap Maximilien-ai/weave-cli
brew install weave-cli
```

## Upgrade

```bash
brew upgrade weave-cli
```

## Verify

```bash
weave --version
weave doctor
```

## Quick Start

```bash
# Interactive configuration
weave config create --env

# Diagnose your setup
weave doctor

# Check database health
weave health check

# List collections
weave cols ls
```

## Requirements

- **tesseract** and **leptonica** (installed automatically by
  Homebrew as dependencies)
- **Go** (build dependency only, not required at runtime)

## Links

- [Weave CLI Repository](https://github.com/maximilien/weave-cli)
- [Documentation](https://github.com/maximilien/weave-cli#readme)
- [Setup Guides](https://github.com/maximilien/weave-cli/tree/main/docs/vdbs)

## License

MIT
