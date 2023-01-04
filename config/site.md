---
depth_order: 1
---

# Site 설정

`jekyll_potion` 의 기본 Site 구성

| 항목                |       유형        | 설명                                                                                                                                                                                                                  |
|:------------------|:---------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `site`            |        -        | `jekyll_potion` Site 설정 Root                                                                                                                                                                                        |
| `site.index_page` |     string      | 기본 index page의 상대 경로<br/>`jekyll_potion`에서 이 값을 세팅할 경우 기존의 index page 를 정의된 페이지로 변경합니다.<br/>만일 설정하지 않을 경우 이미 설정된 값을 따릅니다.                                                                                           |
| `site.permalink`  |     string      | 기본 permalink<br/>`jekyll_potion`에서 이 값을 세팅할 경우 Site 내 모든 페이지의 `permalink` 를 변경합니다.<br/>만일 설정하지 않을 경우 이미 설정된 값을 따릅니다.                                                                                                |
| `site.title`      |     string      | Site 의 기본 title<br/>설정시 {% raw %}`{% code %}`{% endraw %} 태그를 사용하면 내부 title 항목에 채워집니다.                                                                                                                              |
| `site.icon`       |     string      | Site 의 기본 icon<br/>설정시 {% raw %}`{% code %}`{% endraw %} 태그를 사용하면 내부 title 항목에 채워집니다.                                                                                                                               |
| `site.theme`      |     string      | `jekyll_potion` 에서 사용할 theme<br/>이 theme 값은 [Jekyll](https://jekyllrb.com/) 의 기본 theme 와 다르며, `jekyll_potion` scope 내 모든 컨텐츠 파일이 해당 theme 로 적용됩니다.<br/>만일 값이 없을 경우 `jekyll_potion` 의 기본 내장 theme 인 `proto` 로 동작합니다. |
| `site.favicon`    |     string      | Site favicon 정보의 상대 경로<br/>favicon 파일은 단순한 이미지 파일이 아닌 각 브라우저 환경별 favicon 목록을 포함한 html 파일로서 자세한 설명은 [favicon 적용](../start/favicon) 에서 다룹니다.                                                                          |
| `site.exclude`    | array of string | `jekyll_potion` 을 통해 생성한 Site 에서 특정한 컨텐츠 파일을 제외하고 싶은 경우 사용<br/>예를 들어 `README.md` 파일을 GitHub 에서만 사용하고 GitHub Pages 에서는 제외하고 싶을 경우, 해당 파일의 상대 경로를 추가                                                                  |

{% alerts style="info" %}
**`jekyll-potion.site.index_page`, `jekyll-potion.site.permalink` 를 설정시 구동형태**

`jekyll-potion`은 위 두 값을 세팅할 경우 기본 설정 파일의 `defaults` 항목을 아래의 값으로 대체합니다.

만일 아래의 항목이 이미 존재하고 부가적인 속성이 부여됐다면, 그 항목은 건드리지 않습니다.

{% code title="jekyll-potion.site.index_page" %}
```yaml
defaults:
  scope:
    path: "{{jekyll-potion.site.index_page}}"
  values:
    permalink: ""
```
{% endcode %}

{% code title="jekyll-potion.site.permalink" %}
```yaml
defaults:
  scope:
    path: ""
  values:
    layout: "{{theme.default_layout}}"
    permalink: "{{jekyll-potion.site.permalink}}"
```
{% endcode %}

{% endalerts %}

{% alerts style="info" %}
**`site.exclude` 설정시 구동형태**

`jekyll-potion`은 `site.exclude` 내 항목을 `:site` 의 `:after_init` 시점에 `config["exclude"]` 에 추가하며, 이렇게 등록된 리소스는 빌드에서 제외됩니다. 
{% endalerts %}
