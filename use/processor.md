---
depth_order: 1
---

# processor 

processor 는 [Jekyll](https://jekyllrb.com/) 이 구동되는 시점에 문서를 구조화하거나, 검색 인덱스를 만드는 등의 부가적인 기능을 부여합니다.

기본적으로 설정없이 동작되는 processor 와 설정을 해야만 동작하는 processor 로 구분되며, 정의된 processor 는 아래와 같습니다.

| 이름                                                                            | 기본 여부 | 설명                                                                                       |
|-------------------------------------------------------------------------------|-------|------------------------------------------------------------------------------------------|
| [make_base_javascript_processor](./processor/make-base-javascript-processor)  | Y     | 내장된 Tag 를 동작시키는 javascript 를 문서에 추가하는 processor                                          |
| [make-theme-processor](./processor/make-theme-processor)                      | Y     | 정의된 theme 를 구동시키는 processor                                                              |
| [make-front-matter-processor](./processor/make-front-matter-processor)        | Y     | [Front Matter](https://jekyllrb.com/docs/front-matter/) 가 없는 문서의 경우 자동으로 생성해주는 processor |
| [make-title-processor](./processor/make-title-processor)                      | Y     | 문서 제목이 없는 경우 생성해주는 processor                                                             |
| [make-date-processor](./processor/make-date-processor)                        | Y     | 문서 생성, 수정일을 추출하는 processor                                                               |
| [make-favicon-processor](./processor/make-favicon-processor)                  | Y     | favicon 이 존재할 경우 사이트의 favicon 을 생성하는 processor                                           |
| [make-navigation-processor](./processor/make-navigation-processor)            | N     | 디렉토리 구조를 기반으로 navigation menu, 문서 간의 순서를 생성하는 processor                                  |
| [make-empty-content-processor](./processor/make-empty-content-processor)      | N     | 본문이 없는 상위 문서에 하위 문서의 링크를 추가하는 processor                                                  |
| [make-header-link-processor](./processor/make-header-link-processor)          | N     | 문서 내 heading 영역의 링크, 링크 복사 기능을 제공하는 processor                                            |
| [rewrite-img-processor](./processor/rewrite-img-processor)                    | N     | 문서 내 이미지 링크를 분석하여, 상대 경로의 이미지 링크를 문서 context path 에 맞게 변경하는 processor                    |
| [rewrite-a-href-processor](./processor/rewrite-a-href-processor)              | N     | 문서 내 링크를 분석하여, 상대 경로의 링크를 문서 context path 에 맞게 변경하는 processor                            |
| [make-search-index-processor](./processor/make-search-index-processor)        | N     | 문서 내 모든 내용을 분석하여, 검색 index 를 생성하는 processor                                              |
| [make-og-tag-processor](./processor/make-og-tag-processor)                    | N     | 문서를 분석하여, og tag 를 생성하는 processor                                                        |

설정을 해야만 동작하는 processor 의 경우 `jekyll_potion.processors` 에 array 로서 추가한 경우 동작합니다.