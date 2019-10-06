$(function() {
 
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });
  
  $('#work').each(function(){
    
    //タブの各要素をjQueryオブジェクト化
    var $tabList = $(this).find('.tabs-nav'),
        $tabAnchors = $tabList.find('a');
      
    $tabList.on('click','a',function(ecent){
      
      //クリックされたタブをjQueryオブジェクト化
      var $this = $(this);
      
      //もしすでに選択されたタブなら何もせず処理を中止
      if ($this.hasClass('active')){
        return;
      }
      
      //全てのタブを一旦解除し
      //クリックされたタブを選択状態に
      $tabAnchors.removeClass('active');
      $this.addClass('active');
    
    });
    
    //最初のタブを選択状態に
    $tabAnchors.eq(0).trigger('click');
  });
 
 });