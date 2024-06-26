#!/bin/bash

# 从文件中读取文件列表
file_list="$1"

# 检查文件列表是否存在
if [ ! -f "$file_list" ]; then
    echo "usage: $0 <file_list>"
    exit 1
fi

# 逐行读取文件列表
while IFS= read -r file; do
    file="/ad_files/$file"
    # 检查文件是否存在
    if [ -f "$file" ]; then
        # 删除文件
        rm "$file"
        echo "已删除文件: $file"
    else
        echo "文件 $file 不存在"
    fi
done <"$file_list"
