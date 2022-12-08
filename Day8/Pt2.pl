#!/usr/bin/perl

use warnings;
use strict;

my(@trees);

# autobots assemble!
while (<DATA>) {
  chomp;
  my(@row);
  foreach(split(//,$_)){
    push(@row,{ height=>$_, score=>1});
  }
  push(@trees,\@row);
}

# convenience vars to hold dimensions of the block
my($width)=$#{$trees[0]};
my($height)=$#trees;

# walk the grid
for my $i (0..$height){
  for my $j (0..$width){
  
    #check up
    my($view)=0;
    my($u)=$i;
    while($u>0){
      $u--;
      $view++;
      if($trees[$u][$j]->{height} >= $trees[$i][$j]->{height}){
        last;
      }
    }
    $trees[$i][$j]->{score} *= $view;
    
    #check dn
    $view=0;
    $u=$i;
    while($u<$height){
      $u++;
      $view++;
      if($trees[$u][$j]->{height} >= $trees[$i][$j]->{height}){
        last;
      }
    }
    $trees[$i][$j]->{score} *= $view;
    
    #check left
    $view=0;
    $u=$j;
    while($u>0){
      $u--;
      $view++;
      if($trees[$i][$u]->{height} >= $trees[$i][$j]->{height}){
        last;
      }
    }
    $trees[$i][$j]->{score} *= $view;
    
    #check right
    $view=0;
    $u=$j;
    while($u<$width){
      $u++;
      $view++;
      if($trees[$i][$u]->{height} >= $trees[$i][$j]->{height}){
        last;
      }
    }
    $trees[$i][$j]->{score} *= $view;  
  }
}

my($max)=0;
for my $i (0..$#trees){
  for my $j (0..$width){
   if($trees[$i][$j]->{score} > $max){
      $max = $trees[$i][$j]->{score};
   }
  }
}

print $max;

__DATA__
200120010031113332213034140102430141241124321111512323442304040044220141342121012210022220211111200
111021120230012003124233312003010303204555454332453445353125225214221214442214301113012111020220220
010000112330232223210123331341111021455213441355415452453433542411022110033014112420103200010200112
210220131023203033023421012411405531115123145115445215311422135252541100222231431331003220231121021
020112210133112114444340100410411231114131452544155151415233415312511222041221113442132231003203100
121210122332301142321211440441113455552434332511455325315545354524142541534411112013143013120333022
002022223332143323320030004111431434153352153321414154453442552321332341355132444030442110103203212
212130023213100232130230411132244242133251435525323326611211534441513532233340420321144212221332012
112201210213131241203033341411115513233426453426433653356253533133113511115222441140433214102332200
212012000101044144022321521321444445566546646625625665232323663631331412343532242340023204432003233
101233132121222100241254211542133266356326564552445466322626353633223221135151311240430411433022011
200132020222314334333551152431232424524623645555522366665322366466545513112135535223102441334310202
023113000020114221524122422222662645435544455234636242322656464245462233555511334411233402112203303
323212301014434412315252233452332225554646452654545433445553336343544664455435323243510303023142200
310022200424121333144123222262332322343322244646667564465544426245466232342143412141451122001041322
212301111322001335441132334525635254352425553354565445643472236236266635446421522132452121404230333
222212444300345211222512256444456624535343536756355746664436374344346652444335121144422222340114403
133103420101433344253425324366444265345745457464444766674564476573243345254266312555221132304022243
104024111323421413115464433455553477333456354575666765646757774776752425462423244113225443242031103
102001244212344453145353232652647556546465453563544776667356374453675332254663444121345213131024201
224444241243433331136646422564367344447534333336573546336576477746463642222264422255444411444213332
111102440221143134255523244546456346745346547453543465664363545634575433436342252431313443241200434
134231321331555233423635635366465473563535535586445888474374535544636375425246452265522242444124430
234112414314111344422243544643454775656784865866884848444877466476364476356322553554245224411411221
034400114351525345222546546744637535635657575787587675474664764764736443646462322222525151425423322
200214241324215322354446653764777674587466544685754678446567884767437556756324542252661541311422130
343144113253113264625454456777333344687566876677476786864558645875776364454562645333232242321313142
343024121143435322432236376444777668467756646886688564457885758774655565674476525265433235351133020
403402124545255442342535445764457654765745674556784877787445455686478773563733543423236235255444144
103322531152132266562676355566367676848756788886766967585484486646776553753344443262466623351341241
310355244513624552353465735465555764667556575665597778969594858667646774744555337236256442514154340
023311451112523462333545544537465688645559988688956997665697964748587858337347363225646321434554144
320135522136342345436443367666564847488558589757575579796688785767645678467555334323622425311134113
302355525243323546577736555686874886486985688686888898966978978668487864787645754566534465541511251
334125312126266532347576536548547584696886997768569758698995755875465674754333433642553345425533431
341111335132225635365534457665748575977867585959997886979957965558787465664637533766462255534332423
332515314534343636736373478687676678865555895657977886779567677978977887466835476754353523355412552
223554423243256435734467677444784886576856669787898778968956989875566754875777467667635224535114135
155522522343322534364735656868875656687568869667769697877887796866975856457447636733764232364431215
242345244424435673345476658556448689589759768689899966877768987857579874745884637474453634352133231
415255446645436567674735664645455855996887768879976678686967768687868985856885736776326622253351232
345511155426334655353457846578475998667966669787979667866969678557875668566464436456435236255355314
142554534636264637437346664558867877978687978689679869967766679569789677485678377367342526223134543
445152112563265336347774464854776998568899676687677797996796877777879786686845577654534235322155423
333311452256452445537757558677965658888896678979799998788899698785896978877575444547572432544335251
153342523322435374455644657476596955598987666997999878876686677879688676464687476363732553363413554
144335145664565566437454557675966795686769969779977988878679878778787789465465637576634655354532332
152415343652336664567566647557776598677998979889877998977867798897785759685544636646555455665423232
233452324356364643433768554555595977968766779897887998898666688775789556775758843355374525244243434
415514136342636535455644448567857957878867697988999887897878896698589669784466744746433345345355353
232342145445335734443368474877857768999979889789879797978786868766697957448687837436437246435352325
423142134652644455355368647749855698998886897798977997799867788779868756865564445675347463653623132
221215125542657466763755887857659858677696867997877899797779899996787779754784846775376254442211254
154531463524644747547747455647685566769977767978799879788898879798999996758665537564563322242224125
114543323332546776763457675777969696978788779877889799879998997975759878686666834757774555334611241
353441154256436766664748544445957885788777978878979877989798876799786999466647747557553324526153313
433233236244364537664567776764977668967888876787887977898978679686668778764647857553662664333221513
112335142543334473565677774456986769698869989679787999966877889796668798648474667745633463364123315
113555236654542657737447854474695576987788777767987976776779677896568655666568777374452626625515123
335535115334436455537766485588496998559679678997888767666867796988758985466776445675326242423551222
113534446446435634464566878474597579966586699697988866966997787776788976778774466655756463456235323
432234422656545375357656547448457656589888789768979867898878979959955468888683644466555336562315155
313344415452422533675445775845665999956589788887986877769867786689888565577764433373633363624515141
222432351346446453465663784584875977688789959977876966969658866777886544775874577535665532224311252
225114233145352533344653757488874695566977756698769768695668575699668757584555454357642544414312222
033415322244643242337557674678486867575857998965787859688788778777887745544746656765646262354135222
244444135424622245536477356767676647596876888859989597677576756885858547856577434533266366252341111
043422441154553466473376764757644888596669857975585975898957778585855575867574554436566563342243533
331142132342425642446677456357664865566895568659588999997598897847485545576757377726563624233332331
023252542543632422666654576368776445864568889675685656595757555564576478356355573264462564525315531
401013153355343645357335364463874854866687865999886679877556446867474565563474773455256232432344241
021145311524153334266573666344586785645787666877957988698886547444446737764473344255436645355133043
343022114235145422524664767447348848745548778464684486768568675765556575337775543626443412212441440
111402455441135334663624565477563468586767564584754776865658486876757446535673333342623334312243002
300312451335434322222245676775746358685854756547745674447587647487533473336654232544332431554454412
433111155454541556355524273356653577688858857767884847858548544877576457444762553325524214215402141
131233333423335563265232427676636343767667757678865557657665545337553674363435662333422331253432142
424110224332255444554444426563344537343587775787775766858448446366677553432226234426335534235001312
333412002215124441543424366273747763767633456777658554454464446357566564765333524264253113145112300
101110030515255434456252656567734365435643756543777575374763565634563366532624443621453215143234300
303322412424455315323623364345353365376676743654344676735433644466637676342646445331232331222232310
323112211415542144152522545435246756534467755554567676637543357465766366552324534423444455001240332
104010010231221552145233456226456635564775656444567465773637433733444632663325561451234351230241312
121411232340543435321316435636242655564355535365574763633547465475523553325562122152444444042300041
131012210332331125512334254246234345354543573744464635755354544666345534262435114123351541032131413
320204021134412321515435566234224352423426577577364457356445435455454244243342521425351312003010221
323114214132034241313542544555435465334424654666346364554655422236635456436354122354410044244241323
013302120424301452153353441245652435266525344656664634425626224355262362255351231351513443132401213
320030122021334215313244242334523262333453263233364243362363226452453421344311524253311414201210001
232000301112410134252124412414346224626463252363536262245565624425334453135542241232142142113023001
023101113421202000305251552134255163452646652324334242436543224522235515444445314014323100240020120
320223110031202012323335553432231212252653563665545464422324656333443431535442453303001103202231020
102033222010100142203435155413125314311166645446465322244546532441244154143433143443342400201012012
103310002120123402241302221241151441435355114335344522434421453552354154135223134443030043002000021
112323110033212002113322411233332355223342424233213123445224135331545115152043042400020200022133330
022111301200101044211214231433231311322554214331413543414521424255241531111410022413003020200231110
012022111212202121003233141343155411314255551134343533133453252153433344441013011221420230021203220
221101122202110034040022441212441254112211113355531534335143125434435312222200311411322330203331100
210122210200133032213341213111433213432513121525124133544144433541201142230241123430213303001122221