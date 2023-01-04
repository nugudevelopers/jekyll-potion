---
depth_order: 2
---

# theme 만들기

`jekyll-potion` 의 새로운 theme 를 생성하기 위한 요소는 아래와 같습니다.

## path

`jekyll-potion` 에서의 theme 는 특정 path 를 기준으로 하위에 여러 요소를 배치함으로서 구성됩니다.

`path` 는 그 기본이 되는 디렉토리로서 theme 내 모든 디렉토리 요소는 `path` 를 기준으로 하는 상대 경로입니다.

## layouts_dir

[Jekyll](https://jekyllrb.com/) 의 [Includes](https://jekyllrb.com/docs/includes/) 은 markdown 으로 작성된 문서를 HTML 페이지로 전환하기 위한 template 입니다.

template 은 표현할 유형별로 구성이 되며, [Jekyll](https://jekyllrb.com/) 의 설정에 의해 지정된 디렉토리내 파일명을 key 값으로 유형을 구분합니다.

각 template 파일은 필요에 따라 조각으로 나눌 수 있으며, 조각 파일들은 `include_dir` 을 통해 설정이 가능합니다.

`jekyll-potion` 에서의 `layouts_dir` 는 theme `path` 를 기준으로 한 상대 경로를 입력할 수 있으며, 입력하지 않을 경우 기본값이 세팅됩니다.

`jekyll-potion` 은 기본적으로 `default`, `error` 를 사용하며, `default`, `error` 와 동일한 이름을 갖는 layout 을 사용중이라면 변경이 필요합니다.

{% alerts style="warning" %}
만일 새로운 theme 생성시 기존의 layout 을 사용해야 한다면, 해당 layout 파일은 theme 에서 지정한 `layouts_dir` 로 이동해야 합니다.

`jekyll-potion` 은 다른 정적 파일의 위치 경로를 임의로 바꾸지 않기 때문에 파일의 이동(복사)만으로도 기존의 layout 을 사용할 수 있습니다.
{% endalerts %}

## includes_dir

[Jekyll](https://jekyllrb.com/) 의 [Layouts](https://jekyllrb.com/docs/layouts/) 은 layout 의 구성에 따라 나뉘어진 조각 파일을 보관하는 경로입니다.

`jekyll-potion` 에서의 `includes_dir` 는 theme `path` 를 기준으로 한 상대 경로를 입력할 수 있으며, 입력하지 않을 경우 기본값이 세팅됩니다.

## assets

`jekyll-potion` 에서의 `assets` 는 theme 를 구성하는 정적 파일로서 javascript, css, image 등을 보관하는 경로입니다.

`jekyll-potion` 은 이 곳에 등록된 javascript, css 파일을 분석하여 layout 템플릿을 통해 생성된 HTML 페이지의 `<head>` 에 자동으로 추가합니다.

{% alerts style="info" %}
`jekyll-potion` 이 HTML 페이지에 추가한 javascript, css 파일은 자동으로 동작하기 때문에 별도로 layout 에 추가할 필요가 없습니다.
{% endalerts %}

### source_dir

`assets` 의 기본이 되는 root 디렉토리입니다. theme `path` 를 기준으로 한 상대 경로이며, 하위 디렉토리가 있을시 하위 디렉토리 내 파일도 함께 분석합니다.

### target_root_path

`assets.source_dir` 에 지정한 디렉토리 내 분석한 파일을 실제 site 에서 제공할 경로이며 기본값은 `_assets` 입니다.

만일 `assets.source_dir` 내 하위 디렉토리가 있다면, `assets.target_root_path` 이하에 동일한 하위 디렉토리를 생성합니다.

{% alerts style="info" %}
만일 `assets.source_dir` 에 지정한 경로와 동일한 최상위 디렉토리명이 존재한다면, 중복파일이 생길 수 있으며, 변경이 필요합니다. [Jekyll](https://jekyllrb.com/) 은 중복된 경로를 가진 여러 개의 파일이 있을 경우 덮어씁니다.  
{% endalerts %}

### priority_files

`assets.source_dir` 내 파일 중 경우에 따라 우선순위가 필요한 파일들이 있을 수 있습니다.

이럴 경우, 해당 파일명을 순서대로 지정하게 되면 해당 파일부터 HTML 페이지의 `<head>` 에 추가합니다.

### scss_source_dir

[Jekyll](https://jekyllrb.com/) 이 지원하는 SASS, SCSS 의 include 대상 파일을 보관하는 경로입니다.

[Jekyll](https://jekyllrb.com/) 의 `sass.sass_dir` 에 해당되며, 만일 해당 경로를 사용중이였다면, theme `path` 내로 이동이 필요합니다.

### scss_files

`jekyll-potion` 은 `assets.source_dir` 내 SCSS 파일을 자동으로 생성합니다.

이 때 [Jekyll](https://jekyllrb.com/) 의 기본 정책과는 다르게 여러 파일을 생성할 수 있으며, `assets.scss_files` 에 지정한 파일을 순서대로 생성하여 HTML 페이지의 `<head>` 에 추가합니다.

## templates_dir

`jekyll-potion` 은 processor, tag 등의 동작으로 인해 생성되는 HTML 요소를 theme 별로 다르게 지정할 수 있도록 template 기능을 지원합니다.

이러한 template 을 보관하는 경로로서 다른 요소들과 마찬가지로 theme `path` 를 기준으로 한 상대 경로입니다.

template 파일들은 liquid template 으로서 각 processor, tag 에 지정된 규칙을 맞춘다면, 자유롭게 편집할 수 있습니다. 현재 지원하고 있는 template 은 아래와 같습니다.

| 파일명                      | 사용 tag                              |
|--------------------------|-------------------------------------|
| `alerts.liquid`          | [alerts](../use/tag/alerts)         |
| `api.liquid`             | [api](../use/tag/api)               |
| `api=description.liquid` | [api](../use/tag/api)               |
| `api=parameter.liquid`   | [api](../use/tag/api)               |
| `api=response.liquid`    | [api](../use/tag/api)               |
| `code.liquid`            | [code](../use/tag/code)             |
| `empty.liquid`           | [empty](../use/tag/empty)           |
| `file.liquid`            | [file](../use/tag/file)             |
| `link.liquid`            | [link](../use/tag/link)             |
| `logo.liquid`            | [logo](../use/tag/logo)             |
| `navigation.liquid`      | [navigation](../use/tag/navigation) |
| `navigation-page.liquid` | [navigation](../use/tag/navigation) |
| `pagination.liquid`      | [pagination](../use/tag/pagination) |
| `tabs.liquid`            | [tabs](../use/tag/tabs)             |
| `tabs=content.liquid`    | [tabs](../use/tag/tabs)             |

{% alerts style="info" %}
processor 는 liquid template 을 가지고 있지 않습니다. processor 는 지정된 기능을 수행하여, tag 로서 표현합니다.  
{% endalerts %}

{% alerts style="info" %}
만일 이러한 template 작업이 필요하지 않다면(동일한 HTML 구성을 가져간다면) 굳이 생성하지 않아도 됩니다.

만일 theme 내 template 파일들이 존재하지 않다면, 내장 theme 인 proto 의 기본 template 을 사용합니다.
{% endalerts %}

## content_x_path

[Jekyll](https://jekyllrb.com/) 은 layout, 조각 파일을 활용하여, markdown 문서를 템플릿을 이용해 HTML 문서로 생성합니다.

`content_x_path`는 markdown 문서의 본문에 해당되는 HTML 영역을 [Nokogiri](https://github.com/sparklemotion/nokogiri) Node 에서 접근 가능한 css selector 값을 가르킵니다.

해당 값은 [make-search-index-processor](../use/processor/make-search-index-processor) 에서 사용하거나, 본문 내 특정 HTML 요소를 handling 하기 위한 용도로 사용됩니다.

기본값은 `main` 이며, 이는 HTML `<main>` 에 해당됩니다.

{% alerts style="info" %}
반드시 `<main>` 태그를 사용할 필요는 없습니다.

마크업 내 본문에 해당되는 [Nokogiri](https://github.com/sparklemotion/nokogiri) css selector 이기만 하면 됩니다.
{% endalerts %}

## tags & processor

theme 를 만드는 과정속에 layout 이나, template 요소를 수정하고 기본 설정된 css class, attribute 들을 변경했다면 이를 명시해야 합니다. [theme 설정](../config/theme) 을 참조하여, `theme[].processors`, `theme[].tags` 내 class name, attribute 가 변경되었다면, 아래와 같이 변경된 값에 맞도록 설정을 추가합니다.   

{% code title="변경 예시" %}
```yaml
  theme:
    - developers:
        processors:
        make_header_link_processor:
          selector: "a-data-header-link"
          hash_class: "a-hash"
          copy_class: "a-copy-link"
        tags:
          alerts:
            info: "alerts--noti"
            warning: "alerts--warning"
            danger: "alerts--error"
            success: "alerts--confirm"
```
{% endcode %}
