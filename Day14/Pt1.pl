#!/usr/bin/perl

use warnings;
use strict;

my @cave;

while(<DATA>){
 chomp;
 my(@path) = split(/\s->\s/,$_);
 my($x1,$y1) = split(/,/,shift @path);
 foreach(@path){
   my($x2,$y2) = split(/,/,$_);
   if($y1==$y2){
     if(! defined $cave[$y1]){
       $cave[$y1]=[];
     }
     for(;$x2!=$x1; $x1+=($x2>$x1?1:-1)){
       $cave[$y1][$x1]='#';
     }
     $cave[$y1][$x1]='#';
   }elsif($x1==$x2){
     for(; $y1 != $y2; $y1+=($y2>$y1?1:-1)){
       if(! defined $cave[$y1]){
         $cave[$y1]=[];
       }
         $cave[$y1][$x1]='#';
      }
      $cave[$y1][$x1]='#';
    }
  }
}

print "Cave depth: ".$#cave."\n";

# showCave();

my($grains)=-1;
my($finished)=0;

while(! $finished){
  $grains++;
  my($gx)=500;
  my($gy)=0;
  my($rest)=0; # is the grain at rest?
  while(! $rest){
    $gy++;
    if($gy > $#cave){
      $finished=1;
      last;
    }
    if(! defined $cave[$gy][$gx]){
    
    }elsif(! defined $cave[$gy][$gx-1]){
      $gx--;
    }elsif(! defined $cave[$gy][$gx+1]){
      $gx++;
    }else{
      $cave[$gy-1][$gx]='o';
      $rest=1;
    }
  }
}

showCave();
print $grains;

sub showCave{
  for(0..$#cave){
    my($y)=$_;
    for(490..510){
      if(defined $cave[$y][$_]){
        print $cave[$y][$_];
      }else{
        print ".";
      }
    }
    print "\n";
  }

}

__DATA__
498,32 -> 503,32
538,63 -> 538,65 -> 534,65 -> 534,70 -> 551,70 -> 551,65 -> 544,65 -> 544,63
525,56 -> 530,56
552,86 -> 557,86
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
558,104 -> 558,94 -> 558,104 -> 560,104 -> 560,99 -> 560,104 -> 562,104 -> 562,101 -> 562,104 -> 564,104 -> 564,99 -> 564,104
594,151 -> 594,154 -> 591,154 -> 591,162 -> 602,162 -> 602,154 -> 598,154 -> 598,151
504,56 -> 509,56
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
503,52 -> 508,52
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
558,104 -> 558,94 -> 558,104 -> 560,104 -> 560,99 -> 560,104 -> 562,104 -> 562,101 -> 562,104 -> 564,104 -> 564,99 -> 564,104
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
551,90 -> 551,91 -> 561,91 -> 561,90
521,59 -> 521,60 -> 540,60 -> 540,59
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
563,107 -> 563,111 -> 556,111 -> 556,117 -> 574,117 -> 574,111 -> 566,111 -> 566,107
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
594,151 -> 594,154 -> 591,154 -> 591,162 -> 602,162 -> 602,154 -> 598,154 -> 598,151
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
558,80 -> 563,80
594,151 -> 594,154 -> 591,154 -> 591,162 -> 602,162 -> 602,154 -> 598,154 -> 598,151
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
563,107 -> 563,111 -> 556,111 -> 556,117 -> 574,117 -> 574,111 -> 566,111 -> 566,107
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
511,56 -> 516,56
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
518,56 -> 523,56
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
521,59 -> 521,60 -> 540,60 -> 540,59
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
563,107 -> 563,111 -> 556,111 -> 556,117 -> 574,117 -> 574,111 -> 566,111 -> 566,107
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
538,63 -> 538,65 -> 534,65 -> 534,70 -> 551,70 -> 551,65 -> 544,65 -> 544,63
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
594,151 -> 594,154 -> 591,154 -> 591,162 -> 602,162 -> 602,154 -> 598,154 -> 598,151
563,107 -> 563,111 -> 556,111 -> 556,117 -> 574,117 -> 574,111 -> 566,111 -> 566,107
594,151 -> 594,154 -> 591,154 -> 591,162 -> 602,162 -> 602,154 -> 598,154 -> 598,151
572,120 -> 572,123 -> 569,123 -> 569,129 -> 584,129 -> 584,123 -> 577,123 -> 577,120
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
563,107 -> 563,111 -> 556,111 -> 556,117 -> 574,117 -> 574,111 -> 566,111 -> 566,107
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
553,75 -> 557,75
559,86 -> 564,86
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
581,167 -> 581,168 -> 600,168 -> 600,167
572,120 -> 572,123 -> 569,123 -> 569,129 -> 584,129 -> 584,123 -> 577,123 -> 577,120
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
558,104 -> 558,94 -> 558,104 -> 560,104 -> 560,99 -> 560,104 -> 562,104 -> 562,101 -> 562,104 -> 564,104 -> 564,99 -> 564,104
584,135 -> 594,135 -> 594,134
558,104 -> 558,94 -> 558,104 -> 560,104 -> 560,99 -> 560,104 -> 562,104 -> 562,101 -> 562,104 -> 564,104 -> 564,99 -> 564,104
501,29 -> 506,29
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
514,54 -> 519,54
562,83 -> 567,83
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
500,54 -> 505,54
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
558,104 -> 558,94 -> 558,104 -> 560,104 -> 560,99 -> 560,104 -> 562,104 -> 562,101 -> 562,104 -> 564,104 -> 564,99 -> 564,104
551,90 -> 551,91 -> 561,91 -> 561,90
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
538,63 -> 538,65 -> 534,65 -> 534,70 -> 551,70 -> 551,65 -> 544,65 -> 544,63
544,77 -> 548,77
506,50 -> 511,50
505,32 -> 510,32
594,151 -> 594,154 -> 591,154 -> 591,162 -> 602,162 -> 602,154 -> 598,154 -> 598,151
538,63 -> 538,65 -> 534,65 -> 534,70 -> 551,70 -> 551,65 -> 544,65 -> 544,63
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
497,56 -> 502,56
566,86 -> 571,86
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
581,167 -> 581,168 -> 600,168 -> 600,167
572,120 -> 572,123 -> 569,123 -> 569,129 -> 584,129 -> 584,123 -> 577,123 -> 577,120
563,107 -> 563,111 -> 556,111 -> 556,117 -> 574,117 -> 574,111 -> 566,111 -> 566,107
558,104 -> 558,94 -> 558,104 -> 560,104 -> 560,99 -> 560,104 -> 562,104 -> 562,101 -> 562,104 -> 564,104 -> 564,99 -> 564,104
572,120 -> 572,123 -> 569,123 -> 569,129 -> 584,129 -> 584,123 -> 577,123 -> 577,120
558,104 -> 558,94 -> 558,104 -> 560,104 -> 560,99 -> 560,104 -> 562,104 -> 562,101 -> 562,104 -> 564,104 -> 564,99 -> 564,104
572,120 -> 572,123 -> 569,123 -> 569,129 -> 584,129 -> 584,123 -> 577,123 -> 577,120
584,135 -> 594,135 -> 594,134
572,120 -> 572,123 -> 569,123 -> 569,129 -> 584,129 -> 584,123 -> 577,123 -> 577,120
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
538,63 -> 538,65 -> 534,65 -> 534,70 -> 551,70 -> 551,65 -> 544,65 -> 544,63
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
513,50 -> 518,50
563,107 -> 563,111 -> 556,111 -> 556,117 -> 574,117 -> 574,111 -> 566,111 -> 566,107
508,29 -> 513,29
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
558,104 -> 558,94 -> 558,104 -> 560,104 -> 560,99 -> 560,104 -> 562,104 -> 562,101 -> 562,104 -> 564,104 -> 564,99 -> 564,104
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
521,59 -> 521,60 -> 540,60 -> 540,59
547,75 -> 551,75
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
558,104 -> 558,94 -> 558,104 -> 560,104 -> 560,99 -> 560,104 -> 562,104 -> 562,101 -> 562,104 -> 564,104 -> 564,99 -> 564,104
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
538,63 -> 538,65 -> 534,65 -> 534,70 -> 551,70 -> 551,65 -> 544,65 -> 544,63
594,151 -> 594,154 -> 591,154 -> 591,162 -> 602,162 -> 602,154 -> 598,154 -> 598,151
504,26 -> 509,26
521,54 -> 526,54
550,73 -> 554,73
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
550,77 -> 554,77
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
558,104 -> 558,94 -> 558,104 -> 560,104 -> 560,99 -> 560,104 -> 562,104 -> 562,101 -> 562,104 -> 564,104 -> 564,99 -> 564,104
558,104 -> 558,94 -> 558,104 -> 560,104 -> 560,99 -> 560,104 -> 562,104 -> 562,101 -> 562,104 -> 564,104 -> 564,99 -> 564,104
510,52 -> 515,52
492,23 -> 492,15 -> 492,23 -> 494,23 -> 494,22 -> 494,23 -> 496,23 -> 496,14 -> 496,23 -> 498,23 -> 498,21 -> 498,23 -> 500,23 -> 500,18 -> 500,23 -> 502,23 -> 502,22 -> 502,23 -> 504,23 -> 504,18 -> 504,23 -> 506,23 -> 506,21 -> 506,23
509,48 -> 514,48
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
495,45 -> 495,37 -> 495,45 -> 497,45 -> 497,44 -> 497,45 -> 499,45 -> 499,38 -> 499,45 -> 501,45 -> 501,39 -> 501,45 -> 503,45 -> 503,36 -> 503,45 -> 505,45 -> 505,44 -> 505,45 -> 507,45 -> 507,42 -> 507,45 -> 509,45 -> 509,44 -> 509,45 -> 511,45 -> 511,35 -> 511,45
556,77 -> 560,77
572,120 -> 572,123 -> 569,123 -> 569,129 -> 584,129 -> 584,123 -> 577,123 -> 577,120
574,148 -> 574,140 -> 574,148 -> 576,148 -> 576,138 -> 576,148 -> 578,148 -> 578,139 -> 578,148 -> 580,148 -> 580,146 -> 580,148 -> 582,148 -> 582,145 -> 582,148 -> 584,148 -> 584,139 -> 584,148 -> 586,148 -> 586,138 -> 586,148 -> 588,148 -> 588,141 -> 588,148 -> 590,148 -> 590,138 -> 590,148
517,52 -> 522,52
551,90 -> 551,91 -> 561,91 -> 561,90
507,54 -> 512,54
581,167 -> 581,168 -> 600,168 -> 600,167
512,32 -> 517,32
538,63 -> 538,65 -> 534,65 -> 534,70 -> 551,70 -> 551,65 -> 544,65 -> 544,63
555,83 -> 560,83