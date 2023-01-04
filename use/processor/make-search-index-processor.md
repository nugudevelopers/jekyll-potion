---
depth_order: 12
---

# make_search_index_processor 

대상이 되는 모든 문서를 HTML 요소를 분석하고 HTML tag 내 텍스트를 추출하여 검색에 활용할 수 있도록 합니다.

또한 문서 내 `H#` tag 가 존재할 경우 depth 를 분석하고, 분석된 depth 를 통해 검색된 결과의 navigation(링크 정보) 을 구성할 수 있도록 합니다.

추출 대상 HTML tag 는 아래와 같습니다.

| tag           | 설명                                       |
|---------------|------------------------------------------|
| `h#`          | 문서내 depth를 분석하여, 문서 내 영역의 위치, 링크를 생성합니다. |
| `ul`, `ol`    | 요소 내 `li` 내 텍스트를 추출                      |
| `table`       | `thread`, `tbody` 내 `td` 내 텍스트를 추출       |
| `pre`         | code 요소 일 경우의 코드 본문을 추출                  |
| 그 밖의 HTML tag | tag 내 텍스트를 추출                            |

추출된 텍스트는 `{선택한 theme.assets.target_root_path}/base/search.json` 에 다음과 같은 구조로 저장됩니다.

{% code %}
```json
[
  {
    "url": "/use/tag/alerts",
    "order": 30,
    "indexes": [
      {
        "title": "alerts",
        "hash": "",
        "sentences": [
          "alerts",
          "alerts 는 정해진 유형의 시각화를 통해 사용자에게 강조된 내용을 제공합니다.",
          "기본적인 선언은 다음과 같습니다.",
          "{% alerts style=\"{style}\" %}\n{content}\n{% endalerts %}",
          "style | enum | Y | style 은 시각화의 유형을 결정합니다.각 유형은 proto theme 에서 우측 측면에 다음의 색상으로 표현됩니다.* info : #4169E1* warning : #FF8C00* danger : #8B0000* success : #008000style 은 필수값이나, theme 별로 강제화된 값은 없습니다. 필요한 style 이 있다면, 그에 맞는 스타일이 존재한다면, 사용 가능합니다.",
          "content | markdown |   | content 는 시각화를 통해 표현할 본문에 해당됩니다. 모든 markdown 문법을 지원하기 때문에 일반 문서 내용을 작성하듯 작성하면 됩니다.",
          "alerts 의 proto theme 의 기본 template, stylesheet 는 다음과 같습니다.",
          "이 값은 새로운 theme 작성시 용도에 맞게 변경이 가능합니다.",
          "template",
          "stylesheet",
          "alerts.liquid",
          "<div class=\"alerts {{ style }}\">\n    <div class=\"style\"></div>\n    <div class=\"body\">{{ body }}</div>\n</div>",
          "template 작성 항목",
          "style | Y | 선언시 사용한 style",
          "body | Y | 선언시 사용한 content 로서 markdown 으로서 표현됩니다.",
          "div.alerts {\n  @extend %bordered-box;\n  @extend %item-width;\n\n  display: flex;\n\n  & > div.style {\n    width: 0.4em;\n    border-radius: 0.5em 0 0 0.5em;\n  }\n\n  &.info > div.style {\n    background-color: royalblue;\n  }\n\n  &.warning > div.style {\n    background-color: darkorange;\n  }\n\n  &.danger > div.style {\n    background-color: darkred;\n  }\n\n  &.success > div.style {\n    background-color: green;\n  }\n\n  & > div.body {\n    @extend %gap-grid-row;\n    width: calc(100% - 0.4em);\n    height: fit-content;\n    margin: 0.5em 1em;\n\n    img {\n      width: auto;\n      max-height: 6em;\n    }\n  }\n}",
          "자세한 stylesheet 는 _jekyll-potion/lib/theme/proto/assets/main.scss 파일을 참고하세요."
        ]
      }
    ]
  }
]
```
{% endcode %}

| attribute              | 타입              | 설명                  |
|------------------------|-----------------|---------------------|
| []                     | array of object | 페이지 검색 index        |
| [].url                 | string          | 페이지 URL             |
| [].order               | int             | 페이지의 순서             |
| [].indexes             | array of object | 페이지 내 목차별 검색 index  |
| [].indexes[].title     | string          | 페이지 내 목차별 제목        |
| [].indexes[].hash      | string          | 페이지 내 목차별 hash link |
| [].indexes[].sentences | array of string | 목차내 문장 목록           |

생성된 검색 index 파일을 컨트롤하는 javascript 는 다음과 같습니다.

{% code title="header.js" %}
```javascript
(($) => {
  class SearchResults {
    constructor(keyword, per_size) {
      this.page_index_line_numbers_map = new Map()
      this.keyword = keyword
      this.per_size = per_size
      this.search_results = []
    }

    contains(page, index, line_number) {
      if (!this.page_index_line_numbers_map.has(page.url)) {
        this.page_index_line_numbers_map.set(page.url, new Map())
      }

      if (!this.page_index_line_numbers_map.get(page.url).has(index.hash)) {
        this.page_index_line_numbers_map.get(page.url).set(index.hash, [])
      }

      return this.page_index_line_numbers_map.get(page.url).get(index.hash).find(line_numbers => line_numbers.includes(line_number))
    }

    static create_line_numbers(line_number, total_size, per_size) {
      let start = Math.max(0, line_number - (Math.floor(per_size / 2) - (1 - (per_size % 2))))
      let end = Math.min(total_size, start + per_size)

      let n = []

      for (start; start < end; start++) {
        n.push(start)
      }

      return n
    }

    add_line_number(page, index, index_order, line_number) {
      if (!this.contains(page, index, line_number)) {
        let line_numbers = SearchResults.create_line_numbers(line_number, index.sentences.length, this.per_size)
        this.page_index_line_numbers_map.get(page.url).get(index.hash).push(line_numbers)

        this.search_results.push(new SearchResult(page, index, index_order, this.keyword, line_number, line_numbers))
      }
    }

    result() {
      this.search_results.sort((r1, r2) => {
        if (r1.page_order === r2.page_order) {
          if (r1.index_order === r2.index_order) {
            return r1.line_number - r2.line_number
          }

          return r1.index_order - r2.index_order
        }

        return r1.page_order - r2.page_order
      })

      return this.search_results
    }
  }

  class SearchResult {
    constructor(page, index, index_order, keyword, line_number, line_numbers) {
      this.url = page.url + index.hash
      this.title = index.title
      this.page_order = page.order
      this.index_order = index_order
      this.line_number = line_number
      this.sentences = line_numbers.map(n => index.sentences[n].replace(new RegExp('(' + keyword + ')', 'gi'), '<code>$1</code>'))
    }
  }

  class Search {
    constructor(options) {
      this.options = options
      this.loaded = false
      this.page_indexes = []
    }

    init() {
    }

    load_search_file(callback) {
      $.getJSON('{{ search_file }}', data => {
        this.loaded = true
        this.page_indexes = data
        if (callback) {
          callback.call(this)
        }
      })
    }

    search(keyword, context, callback) {
      if (this.loaded) {
        let search_results = new SearchResults(keyword, 3)

        this.page_indexes.forEach((page) => {
          page.indexes.forEach((index, index_order) => {
            index.sentences.forEach((sentence, line_number) => {
              if (new RegExp(keyword, 'i').test(sentence)) {
                search_results.add_line_number(page, index, index_order, line_number)
              }
            })
          })
        })

        if (callback && callback instanceof Function) {
          callback.call(context, search_results.result())
        }
      } else {
        this.load_search_file(() => {
          this.search(keyword, context, callback)
        })
      }
    }
  }

  $.search = (options) => {
    return new Search(options)
  }
})(jQuery)
```
{% endcode %}

해당 javascript는 다음과 같이 사용될 수 있습니다.

{% code %}
```javascript
this.search = $.search()
this.search.search(this.search_input.val(), this, results => {
    this.search_contents.html($.templates('#search_contents_tmpl').render(results))
})
```
{% endcode %}

검색 결과는 위에서 언급된 json 내용이 결과에 맞게 javascript object 형태로 전환되어 리턴되며, template 이나 HTML 요소로 전환할 수 있습니다.

해당 javascript 는 theme 의 설정에 의해 `skip_keyword`, `search_file_name` 값을 변경할 수 있으며, 자세한 내용은 [processor 설정](../../config/theme#processor-설정) 를 참조하세요.

## Hook event

| owner   | event          | 설명                                                           |
|---------|----------------|--------------------------------------------------------------|
| `:site` | `:after_init`  | 검색 파일을 경로에 맞게 생성합니다.                                         |
| `:page` | `:post_render` | 문서를 분석하여 검색 index 를 생성하고 페이지별 검색 문서, javascript 를 문서에 추가합니다. |
| `:site` | `:post_render` | 문서를 분석하여 og tag 를 생성하고 문서에 추가합니다.                            |
