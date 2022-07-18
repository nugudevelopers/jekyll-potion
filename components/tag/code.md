---
depth_order: 3
---

# code

{% tabs %}

{% tabs::content title="템플릿" %}
{% code %}
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

| 변수명                  | 필수여부 | 기본값       | 설명                                              |
|----------------------|------|-----------|-------------------------------------------------|
| `code_class`         | -    | code      | `code` 태그로 인해 생성되는 HTML Root 태그에 부여할 class name |
| `title`              | -    |           | code block Title                                |
| `success_class`      | -    | copy-text | code 복사 성공시 노출될 main class name                 |
| `success_show_class` | -    | show      | code 복사 성공시 노출을 위한 class name                   |
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

| 함수명    | 설명                                                                                                                                                                                                                   |
|--------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `init` | HTML 요소 내 `code_class` 로 설정한 class 를 찾고, `click` 이벤트를 통해 tab content 를 변경합니다.<br/>event 를 추가한 다음 `data-potion-handled` attribute 를 추가하며, `data-potion-handled` attribute 가 추가된 HTML 요소에 대해서는 더 이상 event 를 추가하지 않습니다. |

{% code title="사용법" %}
```javascript
let tabs = $.tabs()

tabs.init() // 문서의 load, 갱신 시 호출해줍니다.
```
{% endcode %}

{% alerts style="info" %}
현재 options 은 사용되고 있지 않습니다.
{% endalerts %}
{% endtabs::content %}

{% tabs::content title="기본 CSS" %}
{% code title="기본 CSS" %}
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
