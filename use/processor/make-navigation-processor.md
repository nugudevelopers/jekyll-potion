---
depth_order: 7
---

# make_navigation_processor 

전체 문서를 분석하여 네비게이션 구조 생성을 생성합니다.

{% alerts style="info" %}
문서의 구조를 생성하지만 실제 사용은 [link](../tag/link) 를 통해서만 표현됩니다.
{% endalerts %}

## Hook event

| owner   | event          | 설명                                                           |
|---------|----------------|--------------------------------------------------------------|
| `:site` | `:post_read`   | 문서의 디렉토리 구조, `depth_order` 를 기준으로 문서를 계층화합다.                 |
