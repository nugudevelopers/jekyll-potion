---
depth_order: 7
---

# logo

![](../../assets/images/logo.png)

`logo` 는 site 의 제목, logo 를 표현하는 tag 로서 layout 에서 사용됩니다.

물론 layout 파일에 직접 site 의 제목, logo 를 꾸밀 수 있지만, `logo` 를 사용할 경우 별도의 수고를 들이지 않아도 됩니다.

기본적인 선언은 다음과 같습니다.

{% code %}
```liquid
{% logo %}
```
{% endcode %}

`logo` 의 `proto` theme 의 기본 template, stylesheet 는 다음과 같습니다.

이 값은 새로운 theme 작성시 용도에 맞게 변경이 가능합니다.

{% tabs %}

{% tabs::content title="template" %}
{% code title="logo.liquid" "%}
```liquid
<div>
    <a href="{{ index_url }}" class="link">
        {% if site_icon %}
            <img src="{{ site_icon }}">
        {% endif %}
        {{ site_title }}
    </a>
</div>
```
{% endcode %}

**template 작성 항목**

| 변수명          | 필수여부 | 설명                    |
|--------------|------|-----------------------|
| `index_url`  | Y    | 설정의 `site.index_page` |
| `site_icon`  | Y    | 설정의 `site.icon`       |
| `site_title` | Y    | 설정의 `site.title`      |
{% endtabs::content %}

{% tabs::content title="stylesheet" %}
{% code %}
```scss
& .header.title {
  & > div > a.link {
    @extend %center-middle;

    font-size: large;
    font-weight: bold;
    color: black;
    text-decoration: none;

    & > img {
      max-height: 2em;
      margin-inline-end: 0.5em;
    }
  }
}
```
{% endcode %}

{% endtabs::content %}
{% endtabs %}
