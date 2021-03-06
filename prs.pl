package prs;

use strict;
use warnings;
use JSON;
use Data::Dumper;

my $query = $ARGV[ 0 ];
print $query;
my $str = `curl 'http://catalog.api.2gis.ru/2.0/catalog/marker/search?query=$query&page=1&page_size=10000&q=query&hash=wol1qna0jx112adk&stat%5Bpr%5D=1&region_id=19&key=ruczoy1743' -H 'Origin: http://2gis.ru' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8,ru;q=0.6' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36' -H 'Accept: */*' -H 'Referer: http://2gis.ru/n_novgorod/search/шиномонтаж?queryState=center%2F43.667908%2C56.30473%2Fzoom%2F11' -H 'Cookie: _ym_uid=1458407541300043310; __gads=ID=77fb95761838a3f5:T=1461243076:S=ALNI_MYCmcy8FB-Dfrj6B2tr40tlB-4mXw; topCities=19-4; _vwo_uuid_v2=C082477B905631487F427EB478D37BAC|909a2bfd871a5357bc83f819887cb82f; country=1; language=ru; city=19; lang=ru; __utma=64270060.1689107794.1458407539.1464020623.1464020623.1; __utmc=64270060; __utmz=64270060.1464020623.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ym_isad=2; _ga=GA1.2.1689107794.1458407539; _2gis_webapi_session=ca394fc0-0c7c-436d-85c1-32de86757943; _2gis_webapi_user=dbbb2a67-9fb3-4014-af86-22b99ade48de' -H 'Proxy-Connection: keep-alive' --compressed`;
##%D1%88%D0%B8%D0%BD%D0%BE%D0%BC%D0%BE%D0%BD%D1%82%D0%B0%D0%B6
my %arr = %{decode_json($str)};
#print Dumper(%arr);
for my $item ( @{ $arr{ "result" }{ "items" } } ) {
        my %it = %{ $item };
        my $id = $it{ "id" };
        my $comp = `curl 'http://catalog.api.2gis.ru/2.0/catalog/branch/get?id=$id&see_also_size=4&fields=items.adm_div%2Citems.region_id%2Citems.reviews%2Citems.point%2Citems.links%2Citems.name_ex%2Citems.org%2Citems.see_also%2Citems.dates%2Citems.external_content%2Citems.flags%2Citems.ads.options%2Citems.email_for_sending.allowed%2Chash%2Csearch_attributes&key=ruczoy1743' -H 'Origin: http://2gis.ru' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8,ru;q=0.6' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36' -H 'Accept: */*' -H 'Referer: http://2gis.ru/n_novgorod/search/%D1%88%D0%B8%D0%BD%D0%BE%D0%BC%D0%BE%D0%BD%D1%82%D0%B0%D0%B6/firm/2674541559939753/tab/firms?queryState=center%2F43.667908%2C56.30473%2Fzoom%2F11' -H 'Cookie: _ym_uid=1458407541300043310; __gads=ID=77fb95761838a3f5:T=1461243076:S=ALNI_MYCmcy8FB-Dfrj6B2tr40tlB-4mXw; topCities=19-4; _vwo_uuid_v2=C082477B905631487F427EB478D37BAC|909a2bfd871a5357bc83f819887cb82f; country=1; language=ru; city=19; lang=ru; __utma=64270060.1689107794.1458407539.1464020623.1464020623.1; __utmc=64270060; __utmz=64270060.1464020623.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.2.1689107794.1458407539; _2gis_webapi_session=ca394fc0-0c7c-436d-85c1-32de86757943; _2gis_webapi_user=dbbb2a67-9fb3-4014-af86-22b99ade48de' -H 'Proxy-Connection: keep-alive' --compressed`;
        my %ar = %{ decode_json( $comp ) };

        print Dumper( %ar );
}

1;
