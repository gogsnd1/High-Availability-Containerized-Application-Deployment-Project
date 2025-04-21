#!/bin/bash

# Stress test configuration
TARGET_URL="http://34.29.139.253:8080/"
TOTAL_REQUESTS=1000
CONCURRENCY=100
TEST_TYPE="apache"  # options: apache, curl

echo "======================================"
echo "  Starting Stress Test"
echo "  Target: $TARGET_URL"
echo "  Requests: $TOTAL_REQUESTS"
echo "  Concurrency: $CONCURRENCY"
echo "  Tool: $TEST_TYPE"
echo "======================================"

if [[ "$TEST_TYPE" == "apache" ]]; then
    echo "Running Apache Benchmark..."
    ab -n "$TOTAL_REQUESTS" -c "$CONCURRENCY" "$TARGET_URL/"
elif [[ "$TEST_TYPE" == "curl" ]]; then
    echo "Running curl loop test..."
    for i in $(seq 1 $TOTAL_REQUESTS); do
        curl -s -o /dev/null -w "%{http_code}\n" "$TARGET_URL" &
        if (( $i % $CONCURRENCY == 0 )); then
            wait
        fi
    done
    wait
else
    echo "Unknown test type: $TEST_TYPE"
    exit 1
fi

echo "======================================"
echo "Stress test completed."
echo "======================================"
