---
depth_order: 8
---

# make_empty_content_processor 

컨텐츠가 없는 페이지의 본문에 {% raw %}`{% empty %}`{% endraw %} 태그를 추가합니다.

## Hook event

| owner   | event         | 설명                                                           |
|---------|---------------|--------------------------------------------------------------|
| `:page` | `:pre_render` | 페이지의 내용이 없을 경우 {% raw %}`{% empty %}`{% endraw %} 태그를 추가합니다. |

{% alerts style="info" %}
주로 하위 페이지는 존재하나, 상위 페이지에 들어갈 내용이 없을 경우 유용하게 사용할 수 있습니다.
{% endalerts %}
