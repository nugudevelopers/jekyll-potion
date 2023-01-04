---
depth_order: 10
---

# rewrite_img_processor 

문서 내 모든 이미지 요소를 조회하고, 상대 경로로 구성된 경우 절대 경로로 변경하고 이를 마킹(css class)합니다.

또한 만일 inline 으로 작성된 이미지로 판단될 경우 이를 마킹(css class)합니다.

생성되는 결과물은 아래와 같습니다.

{% code title="markdown 구문" %}
```markdown
![Download ZIP](../assets/images/download_zip.png)
```
{% endcode %}

{% code title="변환 예시" %}
```html
<img src="/jekyll-potion/assets/images/download_zip.png" alt="Download ZIP" class="img-internal" data-handled="true">
```
{% endcode %}

부여되는 css class 는 theme 의 설정에 의해 `skip_keyword`, `inline_image_class`, `internal_image_class` 값을 변경할 수 있으며, 자세한 내용은 [processor 설정](../../config/theme#processor-설정) 를 참조하세요.

## Hook event

| owner   | event          | 설명                                                                   |
|---------|----------------|----------------------------------------------------------------------|
| `:page` | `:post_render` | 이미지 태그를 검색하고, 상대 경로인지, inline인지 를 파악하고 이에 맞도록 이미지 태그에 class 를 추가합니다. |
