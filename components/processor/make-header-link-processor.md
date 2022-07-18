---
depth_order: 9
---

# make_header_link_processor 

HTML `<h1>` ~ `<h6>` 태그에 복사, 링크 기능을 추가합니다.

주로 markdown 의 `#` ~ `######` 으로 생성된 단락 제목의 링크 정보를 복사하거나 이동하기 위해 사용됩니다.

추가적으로 생성되는 HTML 태그들은 자동으로 생성되는 `theme[].assets.target_root_path/header.js` 에 의해 사용됩니다.

생성되는 결과물은 아래와 같습니다.

{% code title="markdown 구문" %}
```markdown
## 제목
```
{% endcode %}

{% code title="변환 예시" %}
```html
<h2 id="제목">제목
    <a href="#제목" class="go-hash hash-internal a-internal" data-handled="true"></a>
    <div class="copy-link" data-header-link="#제목" data-potion-handled="true"></div>
</h2>
```
{% endcode %}

생성된 HTML 요소를 컨트롤하는 javascript 는 다음과 같습니다.

{% code title="header.js" %}
```javascript
(($) => {
  class Header {
    constructor(options) {
      this.options = options
    }

    init() {
      let copy_links = $('h1, h2, h3, h4, h5, h6').find('[{{ selector }}]:not([data-potion-handled])')

      copy_links.attr('data-potion-handled', 'true')
        .on('click', e => {
          e.preventDefault()

          let $clicked = $(e.currentTarget)

          let url = [$(location).attr('protocol'), $(location).attr('host'), $clicked.attr('{{ selector }}')].join('')

          navigator.clipboard.writeText(url)
        })

      return copy_links
    }
  }

  $.header = (options) => {
    return new Header(options)
  }
})(jQuery)

```
{% endcode %}

해당 javascript 는 theme 의 설정에 의해 `selector`, `hash_class`, `copy_class` 값을 변경할 수 있으며, 자세한 내용은 [processor 설정](../../config/theme#processor-설정) 를 참조하세요.
