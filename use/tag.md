---
depth_order: 1
---

# tag

`jekyll-potion` 은 [jekyll tag](https://jekyllrb.com/docs/plugins/tags/) 을 확장한 다양한 tag 를 통해 일반적인 markdown 문서를 보다 더 풍부한 문서를 꾸밀 수 있습니다.

[jekyll tag](https://jekyllrb.com/docs/plugins/tags/) 을 확장한 구조이기 때문에 기본적인 tag 사용법은 대부분 같습니다.

하지만 `jekyll-potion` 은 지정한 theme 의 `templates_dir` 내 template 파일을 통해 rendering 을 하여 같은 tag 여도 다른 유형의 HTML 요소로 표현이 가능합니다.

문서 내 기본적인 tag 의 사용법은 다음과 같습니다.

{% code title="jekyll-potion tag" %}
```liquid
{% {tagname}-{template_name}::{child_tagname} {variables} %}
```
{% endcode %}

| 구성요소            | 설명                                                                                                                                                                                                                                                                                                                         |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| {tagname}       | liquid tag 와 같은 tagname                                                                                                                                                                                                                                                                                                    |
| {template_name} | 동일한 tag 이름을 가지고 있어도 여러 template 을 활용할 수 있습니다.<br/>`{tagname}-{template_name}` 는 그대로 template 파일명으로 치환되며, 이 파일명에 해당되는 template 을 찾습니다.<br/>예를 들어 {% raw %}`{% logo %}`{% endraw %} 의 template 파일은 `logo.liquid` 이지만 {% raw %}`{% logo-test %}`{% endraw %} 의 template 파일명은 `logo-test.liquid` 이며 다른 template 으로서 표현이 가능합니다. | 
| {child_tagname} | `jekyll-potion` 은 liquid block 을 확장하여 parent-child 구조의 tag 를 선언할 수 있습니다.<br/>예를 들어 tabs 의 구성요소로서 tab 내 본문을 표현할 경우 {% raw %}`{% tabs %}`{% endraw %} 내 {% raw %}`{% tabs::content %}`{% endraw %} 와 같이 선언하여 사용합니다. 이 때 template 파일명은 `tabs::content.liquid` 입니다.                                                            | 
| {variables}     | `jekyll-potion` 은 `key="value"`의 연속된 형태를 통해 template 으로 변수를 전달할 수 있습니다. 각 tag 별로 정의된 변수값을 제외한 추가적인 변수를 선언한 경우, template 에서 동일한 값으로 표현한다면, HTML 요소로서 표현할 수 있습니다.                                                                                                                                                            | 

자세한 `jekyll-potion` 의 tag 사용법은 다음과 같습니다.

| 태그                              | 타입    | 설명                                                                                  |
|---------------------------------|-------|-------------------------------------------------------------------------------------|
| [alerts](./tag/alerts)          | block | Bootstrap 의 Alerts 와 같은 역활을 합니다                                                     |
| [api](./tag/api)                | block | API 명세를 상세히 기술합니다.                                                                  |
| [code](./tag/code)              | block | 코드 블럭에 제목을 입력할 수 있으며, {% raw %}`{{}}`{% endraw %} 구문을 raw 하게 표현합니다. 또한 복사기능을 제공합니다. |
| [empty](./tag/empty)            | tag   | 컨텐츠가 비워진 화면의 하위 페이지가 존재한다면 목록화하여 보여줍니다.                                             |
| [file](./tag/file)              | tag   | 내부 파일 다운로드 기능을 제공합니다.                                                               |
| [link](./tag/link)              | tag   | 내/외부 링크를 구분하여, 외부링크의 경우 제목, 설명을 보강하여 표현합니다.                                         |
| [logo](./tag/logo)              | tag   | 사이트의 이미지, 타이틀을 표현합니다.                                                               |
| [navigation](./tag/navigation)  | tag   | 사이트의 `디렉토리 구조` 를 통해 메뉴를 구성합니다.                                                      |
| [pagination](./tag/pagination)  | tag   | 일정한 규칙에 의해 정의된 페이지의 순서를 통해, 이전, 다음 페이지를 표현합니다.                                      |
| [tabs](./tag/tabs)              | block | Bootstrap 의 Tabs 역활을 합니다.                                                           |
