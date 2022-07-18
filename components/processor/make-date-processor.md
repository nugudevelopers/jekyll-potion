---
depth_order: 5
---

# make_date_processor

각 페이지의 생성, 수정 시간을 확인하고 이를 HTML meta 태그로 추가합니다.

## Hook event

| owner   | event          | 설명                                                                                |
|---------|----------------|-----------------------------------------------------------------------------------|
| `:page` | `:post_render` | 페이지의 생성, 수정 시간을 확인하여, HTML meta 태그로 추가합니다.<br/>단 생성, 수정 시간별로 확인할 수 없다면 추가하지 않습니다. |

생성되는 meta 태그는 아래와 같습니다.

{% code title="생성된 meta 태그" %}
```html
<head>
    ...
    <meta http-equiv="Date" content="2022-07-19 01:49:17 +0000">
    <meta http-equiv="Last-Modified" content="2022-07-19 01:49:17 +0000">
    ...
</head>
```
{% endcode %}

{% alerts style="warning" %}
[GitHub Pages](https://docs.github.com/en/pages/quickstart) 에선 생성일을 확인할 수 없습니다.
{% endalerts %}
