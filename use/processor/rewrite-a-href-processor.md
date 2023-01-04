---
depth_order: 11
---

# rewrite_a_href_processor 

문서 내 모든 링크 요소를 조회하고, 상대 경로로 구성된 경우 절대 경로로 변경하고 이를 마킹(css class)합니다.

또한 만일 index 페이지로의 링크, 해시 링크(#) 내부 링크로 판단될 경우 이를 마킹(css class)합니다.

생성되는 결과물은 아래와 같습니다.

{% code title="markdown 구문" %}
```markdown
[favicon 설정](../../config/site/favicon)
```
{% endcode %}

{% code title="변환 예시" %}
```html
<a href="/jekyll-potion/config/site/favicon" class="a-internal" data-handled="true">favicon 설정</a>
```
{% endcode %}

부여되는 css class 는 theme 의 설정에 의해 `skip_keyword`, `index_page_keyword`, `hash_link_class`, `internal_link_class` 값을 변경할 수 있으며, 자세한 내용은 [processor 설정](../../config/theme#processor-설정) 를 참조하세요.

## Hook event

| owner   | event          | 설명                                                                                |
|---------|----------------|-----------------------------------------------------------------------------------|
| `:page` | `:post_render` | 링크 태그를 검색하고, index 페이지로의 링크, 해시 링크(#) 내부 링크 여부를 파악하고 이에 맞도록 링크 태그에 class 를 추가합니다. |
