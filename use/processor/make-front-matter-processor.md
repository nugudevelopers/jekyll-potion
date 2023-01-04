---
depth_order: 2
---

# make_front_matter_processor 

markdown 페이지중 [Front Matter](https://jekyllrb.com/docs/front-matter/) 가 없는 페이지를 [Jekyll](https://jekyllrb.com/) 에서 인식하도록 합니다.

## Hook event

| owner   | event        | 설명                                                                                                                            |
|---------|--------------|-------------------------------------------------------------------------------------------------------------------------------|
| `:page` | `:post_read` | markdown 페이지중 [Front Matter](https://jekyllrb.com/docs/front-matter/) 가 없는 페이지를 [Jekyll](https://jekyllrb.com/) 에서 인식하도록 합니다. |
