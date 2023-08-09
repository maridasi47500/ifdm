require "nokogiri"
require "open-uri"
Course.destroy_all

def hack(texts,images,mycourse)
  @doc = Nokogiri::HTML(URI.open("https://ifdm.fr/nos-cours-#{mycourse}/"))
  @doc.css("a[target=_blank]").each do |a|
    begin
  
      begin
        @myiconurl=a.css("img")[0].attributes["src"].value
        @myicon=@myiconurl.split("/").last
      rescue
        puts "erreur 3"
      end
      begin
        `(cd "#{Rails.root.to_s+"/public/uploads"}" && wget "#{@myiconurl}" -O "#{@myiconurl.split("/").last.split("?")[0]}")`
      rescue
        puts "erreur 4"
      end
      @title=nil
      begin
        @doc2=Nokogiri::HTML(URI.open(a.attributes['href'].value))

        p "search title"
        @title= @doc2.css(".et_pb_module.et_pb_text.et_pb_text_0.et_clickable.et_pb_text_align_left.et_pb_bg_layout_light")[0].text.strip.squish

      rescue => e
        puts "rreur 6", e.inspect

      end
      begin
        if @title == "" || !@title
          @title=@doc2.css(".et_pb_module.et_pb_text.et_pb_text_0.et_pb_text_align_left.et_pb_bg_layout_light").text.strip.squish
        end
      rescue => e
         p "err 8", e.inpsect
      end
  #e  t_pb_row et_pb_row_1 et_pb_row_4col
  
      #images

      images.each_with_index do |xx,i|
        @doc2.css(xx).each do |xxx|
          p "TITLE!!",@title
          raise "no title" if @title == "" or !@title
          p "description", @doc2.css(texts[i])[0].css('.et_pb_text_inner')
          raise "no description" if @doc2.css(texts[i])[0].css('.et_pb_text_inner').length == 0
          raise "no description" if @doc2.css(texts[i])[0].css('.et_pb_text_inner') == []
          case mycourse
          when "individuels"
          @h=Private.create(name: @title)
          when "collectifs"
          @h=Collective.create(name: @title)
          end
          p "my icon", @myicon
          @h.icon=@myicon
          begin
            @myimageurl=xxx.css("img")[0].attributes["src"].value
            @h.image=@myimageurl.split("/").last
          rescue => e
            puts("erreur 1",e.inspect)
          end
          begin
            if !@myimageurl
              @myimageurl=xxx.css("img").attributes["src"].value
              @h.image=@myimageurl.split("/").last
            end
          rescue => e
            puts("erreur 1",e.inspect)
          end
          begin
            `(cd "#{Rails.root.to_s+"/public/uploads"}" && wget "#{@myimageurl}" -O "#{@myimageurl.split("/").last.split("?")[0]}")`
          rescue => e
            puts("erreur 2",e.inspect)
          end
          @doc2.css(texts[i]).each do |aaa|
            @h.description=aaa.css('.et_pb_text_inner').inner_html
          end
          @h.save

        end
      end
      @title=nil
    rescue => e
      puts("NEXT !!!",e.inspect)
      next 
    end
  
  end
end
@texts=2.step(by: 2).take(2).map{|h|".et_pb_column.et_pb_column_1_4.et_pb_column_#{h}.et_pb_css_mix_blend_mode_passthrough"}
@images=1.step(by: 2).take(2).map{|h|".et_pb_column.et_pb_column_1_4.et_pb_column_#{h}.et_pb_css_mix_blend_mode_passthrough"}
@texts2=3.step(by: 2).take(1).map{|h|".et_pb_column.et_pb_column_1_4.et_pb_column_#{h}.et_pb_css_mix_blend_mode_passthrough"}
@images2=2.step(by: 2).take(1).map{|h|".et_pb_column.et_pb_column_1_4.et_pb_column_#{h}.et_pb_css_mix_blend_mode_passthrough"}
hack(@texts,@images,"individuels")
hack(@texts2,@images2,"individuels")
hack(@texts,@images,"collectifs")
hack(@texts2,@images2,"collectifs")
