---
depth_order: 2
---

# theme 설정

theme 는 `jekyll-potion` 을 구성하는 가장 중요한 요소로서 아래와 같은 특징을 갖습니다.

* [Jekyll](https://jekyllrb.com/) 의 `includes_dir`, `layouts_dir` `sass.sass_dir` 을 변경하여 `jekyll-potion` theme 구성요소를 로드
* [tag](../use/tag), [processor](../use/processor) 를 통해 생성된 HTML 요소를 템플릿화하여, 다른 형태의 look & feel 로 전환할 수 있도록 함
* 사용자가 새롭게 theme 를 정의하여, 사이트 성격에 맞게 layout, javascript, css 를 구현할 수 있도록 함
* 내장 theme 를 통해, 사이트 디자인을 고려하지 않고 바로 문서를 제작할 수 있도록 하고, 그동안 사이트 디자인 작업을 하여, 병행 개발을 가능토록 함

theme 는 크게 내장 theme, 사용자들이 직접 개발하여 추가할 수 있는 custom theme 로 구분됩니다.

내장 theme 는 현재 `proto` 로 불리며, 별도의 설정이 없을 경우 이 theme 로 구동됩니다. 

custom theme 는 사용자가 직접 마크업 작업을 하여, 정해진 규칙에 맞게 설정하면, 이를 구동 시킬 수 있도록 합니다. 자세한 내용은 [theme 만들기](../use/theme/make-theme) 를 참고하세요.

theme 의 설정은 아래와 같이 설정되며, 크게, theme 자체에 대한 설정인 기본 설정, processor 들의 설정인 processor 설정, 태그들의 설정인 태그 설정으로 구분됩니다.

각각에 대한 세부적인 설정은 아래와 같습니다.

## 기본 설정

theme 의 위치, 세부 속성들의 정보를 다룹니다. 세부 항목은 아래와 같습니다.

{% code title="기본 설정" %}
```yaml
  theme:
    - developers:
        path: "your theme path"
        layouts_dir: "_layouts"
        includes_dir: "_includes"
        assets:
          source_dir: "assets"
          target_root_path: "_assets"
          priority_files: []
          scss_source_dir: "_scss"
          scss_files: []
        templates_dir: "_templates"
        content_x_path: "main"
        processors: ...
        tags: ...
```
{% endcode %}

| 항목                                | 유형              | 필수  | 기본값        | 설명                                                                                                                                                                                 |
|-----------------------------------|-----------------|:---:|------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `theme`                           | array of Hash   |  -  | -          | theme 설정 Root                                                                                                                                                                      |
| `theme[].hash keyname`            | string          |  O  | -          | theme 이름                                                                                                                                                                           |
| `theme[].path`                    | string          |  O  | -          | 프로젝트의 Root path<br/>최상단 기준의 상대 경로                                                                                                                                                  |
| `theme[].layouts_dir`             | string          |  -  | _layouts   | layout 파일을 보관하는 theme path 기준의 상대 경로                                                                                                                                               |
| `theme[].includes_dir`            | string          |  -  | _includes  | include 파일을 보관하는 theme path 기준의 상대 경로                                                                                                                                              |
| `theme[].default_layout`          | string          |  -  | default    | default layout 명                                                                                                                                                                   |
| `theme[].assets`                  | Hash            |  -  | -          | theme 내 asset 들의 정보                                                                                                                                                                |
| `theme[].assets.source_dir`       | string          |  -  | assets     | theme 내 asset 들의 기본 경로로서 theme path 기준의 상대 경로                                                                                                                                      |
| `theme[].assets.target_root_path` | string          |  -  | _assets    | theme 내 asset 들의 사이트 접근 URL path<br/>`theme[].assets.source_dir` 이하의 경로들의 Root에 해당된다.                                                                                              |
| `theme[].assets.priority_files`   | array of string |  -  | -          | theme 내 asset 들 중 우선순위가 높은 파일(ex> jquery...) 들을 명시하여, 다른 asset 보다 먼저 선언될 수 있도록 한다.                                                                                                 |
| `theme[].assets.scss_source_dir`  | string          |  -  | _scss      | `jekyll-potion`은 theme 의 stylesheet 중 공식적으로 css, scss 만을 지원한다. scss 사용시 `@import` 대상을 경로로서 이 경로에 `a.scss` 파일을 include 할 경우 `@import "a"` 와 같이 사용한다.                                |
| `theme[].assets.scss_files`       | array of string |  -  | -          | scss 컴파일 대상 파일의 theme path 기준의 상대 경로 목록<br/>[Jekyll](https://jekyllrb.com/) 은 기본적으로 1개의 scss 파일만을 사용할 수 있으나, `jekyll-potion`은 theme 내 asset 들 중 일치하는 path를 갖는 scss 일 경우 컴파일을 수행한다. |
| `theme[].templates_dir`           | string          |  -  | _templates | 태그 등의 HTML 템플릿 파일(liquid 파일 지원)을 보관하는 theme path 기준의 상대 경로                                                                                                                         |
| `theme[].content_x_path`          | string          |  -  | main       | rendering 된 HTML 중 본문 영역에 해당되는 [Nokogiri](https://github.com/sparklemotion/nokogiri) Node 에서 접근 가능한 css selector 값<br/>검색 및 자체 내장 javascript에서 사용                                  |

## processor 설정

processor 로 인해 생성되는 마크업 요소의 설정값을 다룹니다. processor 별 자세한 설명은 [processor](../use/processor) 를 통해 확인할 수 있으며 세부 항목은 아래와 같습니다.

{% code title="processor 설정" %}
```yaml
  theme:
    - developers:
        ...
        processors:
          make_header_link_processor:
            selector: "data-header-link"
            hash_class: "go-hash"
            copy_class: "copy-link"
          rewrite_img_processor:
            skip_keyword: "data-skip-src-to-absolute"
            inline_image_class: "img-inline"
            internal_image_class: "img-internal"
          rewrite_a_href_processor:
            skip_keyword: "data-skip-href-to-absolute"
            index_page_keyword: "data-to-index-page"
            hash_link_class: "hash-internal"
            internal_link_class: "a-internal"
          make_search_index_processor:
            skip_keyword: "data-skip-search-index"
            search_file_name: "search.json"
        tags: ...
```
{% endcode %}

| 항목                                                                 | 기본값                        | 설명                                                        |
|--------------------------------------------------------------------|----------------------------|-----------------------------------------------------------|
| `theme[].processors`                                               | -                          | processor 설정 Root                                         |
| `theme[].processors.make_header_link_processor`                    | -                          | make_header_link_processor 설정 Root                        |
| `theme[].processors.make_header_link_processor.selector`           | data-header-link           | heading 태그(`<h1>` ~ `<h6>`) 의 링크 정보를 담고 있는 attribute name |
| `theme[].processors.make_header_link_processor.hash_class`         | go-hash                    | heading 태그 내 hash 태그를 표현하는 class name                     |
| `theme[].processors.make_header_link_processor.copy_class`         | copy-link                  | heading 태그 내 복사를 표현하는 class name                          |
| `theme[].processors.rewrite_img_processor`                         | -                          | rewrite_img_processor 설정 Root                             |
| `theme[].processors.rewrite_img_processor.skip_keyword`            | data-skip-src-to-absolute  | `<img>` 태그의 `src` attribute 변경을 제외하는 attribute name       |
| `theme[].processors.rewrite_img_processor.inline_image_class`      | img-inline                 | inline image(글자 내 이미지)로 판단될 경우 추가되는 class name            |
| `theme[].processors.rewrite_img_processor.internal_image_class`    | img-internal               | 내부 이미지로 판단될 경우 추가되는 class name                            |
| `theme[].processors.rewrite_a_href_processor`                      | -                          | rewrite_a_href_processor 설정 Root                          |
| `theme[].processors.rewrite_a_href_processor.skip_keyword`         | data-skip-href-to-absolute | `<a>` 태그의 `href` attribute 변경을 제외하는 attribute name        |
| `theme[].processors.rewrite_a_href_processor.index_page_keyword`   | data-to-index-page         | index 페이지로의 링크로 판단될 경우 추가되는 class name                    |
| `theme[].processors.rewrite_a_href_processor.hash_link_class`      | hash-internal              | hash 링크로 판단될 경우 추가되는 class name                           |
| `theme[].processors.rewrite_a_href_processor.internal_link_class`  | a-internal                 | 내부 링크로 단단될 경우 추가되는 class name                             |
| `theme[].processors.make_search_index_processor`                   | -                          | make_search_index_processor 설정 Root                       |
| `theme[].processors.make_search_index_processor.skip_keyword`      | data-skip-search-index     | 검색 index 생성시 제외하는 attribute name                          |
| `theme[].processors.make_search_index_processor.search_file_name`  | search.json                | 검색 index 파일명                                              |

## 태그 설정

태그로 인해 생성되는 마크업 요소에 대한 설정값입니다. 태그에 대한 자세한 설명은 [태그](../use/tag) 에서 다루며, 상세한 내용은 아래와 같습니다.

{% code title="태그 설정" %}
```yaml
  theme:
    - developers:
        ...
        tags:
          alerts:
            info: "info"
            warning: "warning"
            danger: "danger"
            success: "success"
          code:
            code_class: "code"
            success_class: "copy-text"
            success_show_class: "show"
          tabs:
            tabs_class: "tabs"
            active_class: "active"
          navigation:
            active_class: "active"
            fold_class: "fold"
```
{% endcode %}

| 항목                                       | 기본값       | 설명                                  |
|------------------------------------------|-----------|-------------------------------------|
| `theme[].tags`                           | -         | tag 설정 Root                         |
| `theme[].tags.alerts`                    | -         | alerts 설정 Root                      |
| `theme[].tags.alerts.info`               | info      | style 값이 info 일 때 class name        |
| `theme[].tags.alerts.warning`            | warning   | style 값이 warning 일 때 class name     |
| `theme[].tags.alerts.danger`             | danger    | style 값이 danger 일 때 class name      |
| `theme[].tags.alerts.success`            | success   | style 값이 success 일 때 class name     |
| `theme[].tags.code`                      | -         | code 설정 Root                        |
| `theme[].tags.code.code_class`           | code      | code 태그 class name                  |
| `theme[].tags.code.success_class`        | copy-text | code 복사 성공시 노출될 class name          |
| `theme[].tags.code.success_show_class`   | show      | code 복사 성송시 노출에 사용할 class name      |
| `theme[].tags.tabs`                      | -         | tabs 설정 Root                        |
| `theme[].tags.tabs.tabs_class`           | tabs      | tabs 의 class name                   |
| `theme[].tags.tabs.active_class`         | active    | tab 의 active 시 class name           |
| `theme[].tags.navigation`                | -         | navigation 설정 Root                  |
| `theme[].tags.navigation.active_class`   | active    | navigation menu 가 선택될 경우 class name |
| `theme[].tags.navigation.fold_class`     | fold      | 하위 menu 가 접혀 있을 때 class name        |
