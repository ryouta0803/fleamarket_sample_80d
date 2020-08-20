$(document).on('turbolinks:load', ()=> {
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
    }
    // 子カテゴリーを表示させる。
    function appendChildrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'children_wrapper'>
                          <div class='exhibitionPage__main__contents__detail__category__choose1'>
                            <select class="exhibitionPage__main__contents__detail__category__choose--select" id="child_category" name="item[category_id]">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            </select>
                          </div>
                        </div>`;
      $('.exhibitionPage__main__contents__detail__category__choose').append(childSelectHtml);
    }
    // 孫カテゴリーを表示させる。
    function appendGrandchildrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'grandchildren_wrapper'>
                                <div class='exhibitionPage__main__contents__detail__category__choose2'>
                                  <select class="exhibitionPage__main__contents__detail__category__choose__box--select" id="grandchild_category" name="item[category_id]">
                                    <option value="---" data-category="---">---</option>
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;
      $('.exhibitionPage__main__contents__detail__category__choose').append(grandchildSelectHtml);
    }
    
    // 親カテゴリーを選択した後にイベント発火させる。
    $('#parent_category').on('change', function(){
      console.log($('#parent_category'));
      // 選択された親カテゴリーのidを取得
      // var parent_category_id = document.getElementById
      var parent_category_id = $(this).val();
      // console.log(parent_category_id);
      ('parent_category').value; 
      if (parent_category_id != "---"){ 
        $.ajax({
          url: '/items/category/get_category_children',
          type: 'GET',
          data: { parent_id: parent_category_id },
          dataType: 'json'
        })
        .done(function(children){         
          // 親カテゴリー削除された時、子・孫カテゴリーを削除する。
          console.log(children)
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
          console.log($('#children_wrapper'))
          // debugger;
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChildrenBox(insertHTML);
        })
        // エラー警告
        .fail(function(){
          $('#children_wrapper').remove();
          $('#grandchildren_wrapper').remove(); 
          alert('カテゴリーを選択してください');
        })
      }else{
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
      }
    });
    $('.content-sale__main__box__form').on('change', '#child_category', function(){
      console.log("#child_category");
      var child_category_id = $('#child_category option:selected').data('category');
      // データが取得できていないからチェック#child_category option:selected
      // debugger;
      if (child_category_id != "---"){ 
        $.ajax({
          url: '/items/category/get_category_grandchildren',
          type: 'GET',
          data: { child_id: child_category_id },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            // 子カテゴリーが変更された時、孫カテゴリーを削除する。
            $('#grandchildren_wrapper').remove(); 
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchildrenBox(insertHTML);
          }
        })
        // エラー警告
        .fail(function(){
          $('#grandchildren_wrapper').remove(); 
          alert('カテゴリーを選択してください');
        })
      }else{
        $('#grandchildren_wrapper').remove(); 
      }
  });
});