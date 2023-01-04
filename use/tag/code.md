---
depth_order: 3
---

# code

`code` 는 markdown 에서 작성된 코드 블럭을 확장하여, 코드 제목, 복사기능과 더불어 블럭 내 {% raw %}`{{ ~ }}`{% endraw %} 등의 liquid tag 문법 사용이 가능하도록 합니다.

기본적인 선언은 다음과 같습니다.

{% code %}
````liquid
{% code title="test.java" %}
```
{content}
```
{% endcode %}
````
{% endcode %}

{% alerts style="warning" %}
`code` tag 내 `{content}` 는 반드시 하나의 코드블럭 <code>```{content}```</code> 와 같이 구성되어야만 정확히 표현됩니다. 만일 코드블럭 바깥쪽에 컨텐츠가 존재할 경우 문법 오류가 발생하고, 빌드되지 않습니다.
{% endalerts %}

`code` 의 `proto` theme 의 기본 template, javascript, stylesheet 는 다음과 같습니다.

이 값은 새로운 theme 작성시 용도에 맞게 변경이 가능합니다.

{% tabs %}

{% tabs::content title="template" %}
{% code title="code.liquid" %}
```liquid
<div class="{{ code_class }}">
    <div class="header">
        <div class="title">{{ title }}</div>
        <div class="copy" data-code-copy-target-id></div>
        <div class="{{ success_class }}" data-skip-search-index>복사성공!</div>
    </div>
    <div class="body">{{ body }}</div>
</div>
```
{% endcode %}

**template 작성 항목**

| 변수명                        | 필수여부 | 설명                                                                                                                                                                                    |
|----------------------------|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `code_class`               | Y    | `code` 태그로 인해 생성되는 HTML Root 태그에 부여할 class name                                                                                                                                       |
| `title`                    |      | code 블럭 Title                                                                                                                                                                         |
| `data-code-copy-target-id` |      | code 블럭 복사 기능을 위한 key<br/>만일 복사 기능을 사용하지 않을 경우 필요하지 않음                                                                                                                                |
| `success_class`            |      | code 복사 성공시 노출될 main class name                                                                                                                                                       |
| `data-skip-search-index`   |      | `data-skip-search-index` 은 [make_search_index_processor](../processor/make-search-index-processor)를 통해 검색 index 생성을 피하기 위한 keyword 입니다.<br/>복사 성공시 노출되는 키워드이기 때문에 검색 index 를 만들 필요 없음 |
| `body`                     | Y    | code 본문                                                                                                                                                                               |
{% endtabs::content %}

{% tabs::content title="javascript" "%}
{% code title="code.js" %}
```javascript
(($) => {
  class Code {
    constructor(options) {
      this.options = options
    }

    init() {
      let copy_codes = $('.{{ code_class }}').find('[data-code-copy-target-id]:not([data-potion-handled])')

      copy_codes.attr('data-potion-handled', 'true')
        .on('click', e => {
          e.preventDefault()

          let $clicked = $(e.currentTarget)

          parent = $clicked.parents('.{{ code_class }}')
          let code = parent.find('td.rouge-code').text().trim()

          navigator.clipboard.writeText(code).then(() => {
            let $success = parent.find('.{{ success_class }}')

            if ($success[0]) {
              $success.addClass('{{ success_show_class }}')
              setTimeout(() => $success.removeClass('{{ success_show_class }}'), 1000)
            }
          })
        })

      return copy_codes
    }
  }

  $.code = (options) => {
    return new Code(options)
  }
})(jQuery)
```
{% endcode %}

`jekyll-potion` 은 [jquery](http://jquery.com/) 를 사용합니다.

javascript 는 {% raw %}`{{ ~ }}`{% endraw %} 을 포함한 template 이며, 설정에서 결정한 값을 매핑하여 javascript 파일을 생성합니다.

{% raw %}`{{ ~ }}`{% endraw %} 구문은 [태그 설정](../../config/theme#태그-설정) 의 `theme[].tags.code` 항목을 참고해 주세요.

**함수 설명**

| 함수명    | 설명                                                                                                                                                                                                               |
|--------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `init` | HTML 요소 내 `code_class` 로 설정한 class 를 찾고, 코드 블럭 복사 기능을 `click` 이벤트에 추가합니다.<br/>event 를 추가한 다음 `data-potion-handled` attribute 를 추가하며, `data-potion-handled` attribute 가 추가된 HTML 요소에 대해서는 더 이상 event 를 추가하지 않습니다. |

**사용법**

{% code %}
```javascript
let code = $.code()

code.init() // 문서의 load, 갱신 시 호출해줍니다.
```
{% endcode %}

{% endtabs::content %}

{% tabs::content title="stylesheet" %}
{% code %}
```scss
div.tabs {
  @extend %box;
  @extend %item-width;

  & > ul {
    display: flex;
    column-gap: 0.5em;
    padding: 0;
    margin: 0 0 -1px;

    & > li.tab-title {
      @extend %title-fixed;
      display: block;
      padding: 0 2em;
      border-block-end: none;

      &.active {
        background-color: white;
      }

      &:hover {
        cursor: pointer;
      }
    }
  }

  & > div.tab-content {
    @include border(border);
    @extend %shadow;

    border-radius: 0 0.5em 0.5em 0.5em;
    padding: 1em 0.5em;
    display: none;

    &.active {
      display: block;
    }

    & > div.content {
      @extend %gap-grid-row;

      & > .code {
        width: 100%;
      }
    }
  }
}
```
{% endcode %}

{% endtabs::content %}
{% endtabs %}
