#!/usr/bin/perl

use warnings;
use strict;

use Data::Dumper;

my(@grid) = ([]);


# construct our rope, set 1 for Pt1, 9 for Pt2
my($length)=9;
my(@t);
for(0..$length){
  # start with enough space from 0,0 as we can't handle negative indices well
  $t[$_]=[1000,1000];
}

# instruction decoder for X and Y
my $travel = {
   U => [ 0, 1],
   D => [ 0,-1],
   L => [-1, 0],
   R => [ 1, 0]
};

# autobots assemble!
while (<DATA>) {
  my($dir,$steps)=$_=~/(\w)\s+(\d+)/;
  moveHead($steps,$travel->{$dir});
}

# count em up

print countMap();

# subs below ...
sub moveHead{
  my($steps,$dir)=@_;
  for(1..$steps){
    # Move the head 1 step
    $t[0][0] += $dir->[0];
    $t[0][1] += $dir->[1];
    if(!defined($grid[$t[0][1]])){
      $grid[$t[0][1]]=[];
    }
    if(!defined($grid[$t[0][1]])){
      $grid[$t[0][1]]=[];
    }
    for(1..$length){
       moveTail($_);
    }
    # showRopeMap();
    # print $h[0].",".$h[1]." -> ".$t[0].",".$t[1]."\n";
  }
}

sub moveTail{
  my($knot)=shift;

  my($xoff) = ($t[$knot-1][0]-$t[$knot][0]);
  my($yoff) = ($t[$knot-1][1]-$t[$knot][1]);
  
  my(@move)=(0,0);
  
  # do we need an x axis move?
  if($xoff > 1){
    # yes, in + direction;
    $move[0] =1;
    # do wee need to make that into a diagonal move? if so, choose the righty shift;
    if($yoff > 0){
      $move[1] =1;
    }
    if($yoff < 0){
      $move[1] =-1;
    }
  }
  
  # rinse and repeat for the other possibilities in x
  if($xoff < -1){
    $move[0]=-1;
        if($yoff > 0){
      $move[1] =1;
    }
    if($yoff < 0){
      $move[1] =-1;
    }
  }
  
  # repeat the same logic in Y .. 
  if($yoff > 1){
    $move[1] =1;
    if($xoff > 0){
      $move[0] =1;
    }
    if($xoff < 0){
      $move[0] =-1;
    }
  }
  if($yoff < -1){
    $move[1]=-1;
    if($xoff > 0){
      $move[0] =1;
    }
    if($xoff < 0){
      $move[0] =-1;
    }
  }

  $t[$knot][0]+=$move[0];
  $t[$knot][1]+=$move[1];

  # check if we made our start point far enough away from the -ve edges
  if($t[$knot][0]<0 || $t[$knot][1]<0){
      print "exceeded bounds";
      exit 0;
  }

  # tag the current tail position
  $grid[$t[$length][1]][$t[$length][0]]=1;
}

sub countMap{
  my($touched)=0;
  for my $i(reverse(0..$#grid)){
    for my $j (0..$#{$grid[$i]}){
      if(defined($grid[$i][$j])){
        $touched++;
      }
    }
  }
  return $touched;
}

# These are not needed, but were useful when debugging

sub showTailMap{
 # print "\n";
  for my $i(reverse(0..$#grid)){
    for my $j (0..$#{$grid[$i]}){
      if(defined($grid[$i][$j])){
        print "#";
      }else{
        print ".";
      }
    }
    print "\n";
  }
  print "\n";
}

sub showRopeMap{
  print "\n";
  for my $i(reverse(0..$#grid)){
    for my $j (0..6){
      my($c)=".";
      for(reverse(0..$length)){
        if($t[$_][0]==$j && $t[$_][1]==$i){
          $c=$_;
          if($c==0){ $c='H'; }
        }
      }
      print $c;
    }
    print "\n";
  }
  print "\n";
}

__DATA__
U 1
D 2
U 1
L 1
R 1
L 1
D 1
L 2
U 2
L 2
D 2
L 2
D 2
L 1
R 1
D 1
U 1
D 1
R 1
U 2
D 2
R 2
L 2
R 2
D 2
L 2
D 2
R 1
L 2
D 2
R 2
D 1
R 1
L 1
D 1
U 1
L 2
D 2
R 1
L 2
R 1
U 1
R 1
L 1
R 2
D 1
U 1
D 1
R 1
U 2
R 2
D 1
R 2
D 1
U 1
D 1
R 2
U 2
D 1
U 2
D 1
L 1
D 1
U 2
R 1
L 1
R 1
D 2
U 1
D 2
L 1
R 2
U 2
R 1
D 1
R 1
U 1
R 1
U 2
R 2
L 1
U 1
D 2
U 1
D 2
L 2
D 1
U 2
L 1
U 1
D 1
U 1
L 1
D 2
L 2
R 1
D 1
L 2
D 2
R 2
L 1
D 1
L 2
U 2
L 1
R 2
U 1
D 1
L 1
U 2
L 1
D 1
U 3
D 3
L 3
U 2
R 1
U 2
R 1
U 2
L 2
U 3
R 2
L 1
U 1
D 3
R 3
U 1
D 3
L 2
R 1
L 1
U 3
R 3
D 3
U 2
L 3
D 3
U 1
L 1
U 2
D 1
L 3
D 3
R 3
U 1
L 2
R 1
L 3
U 2
D 2
R 3
D 3
L 1
R 2
D 1
L 3
U 1
D 3
U 3
D 1
U 1
R 1
U 2
L 1
D 3
R 3
D 1
U 2
D 2
L 3
D 3
U 1
D 2
R 2
L 1
D 3
L 1
U 2
L 2
D 1
L 3
R 1
L 1
R 3
U 1
L 3
R 2
L 1
D 1
R 3
D 1
R 1
D 1
L 3
D 1
U 2
R 3
D 1
U 1
R 2
U 1
R 3
L 3
U 3
D 2
R 3
L 1
D 2
R 2
L 2
U 1
L 3
R 2
L 2
U 3
L 1
D 1
U 2
R 1
U 3
R 2
D 3
L 3
U 4
D 4
R 3
L 3
R 3
U 2
R 3
L 4
R 2
U 1
R 3
U 3
R 4
U 2
D 3
L 3
D 4
U 3
D 4
U 3
D 2
R 2
D 1
R 4
U 2
D 4
L 3
D 4
U 1
L 2
R 1
L 3
R 1
L 3
U 3
D 3
U 4
L 2
D 4
L 4
U 4
L 3
D 1
R 2
U 4
R 2
L 1
R 3
D 2
L 3
U 2
R 1
U 1
D 3
L 4
D 3
L 3
D 3
U 4
D 3
R 4
L 1
U 2
R 4
D 2
U 3
L 4
R 2
L 1
D 4
U 3
R 2
L 2
R 4
L 4
D 1
L 3
D 4
L 3
U 2
R 2
D 4
R 2
U 2
D 1
U 4
D 2
R 4
D 1
U 1
D 1
R 1
L 1
R 2
U 4
R 4
D 3
R 4
L 1
D 2
U 1
L 3
U 4
R 3
D 4
L 1
D 1
L 4
D 3
R 1
D 4
L 3
R 2
D 3
L 2
D 4
U 2
L 2
D 4
L 2
U 5
R 3
D 2
U 5
R 3
L 3
R 1
D 4
R 1
D 3
U 3
R 2
D 5
U 4
L 1
D 1
R 5
D 5
U 1
L 3
D 2
L 4
U 3
L 2
U 1
R 1
U 2
D 5
L 1
R 4
L 1
U 3
L 5
U 2
L 1
R 1
L 1
R 1
U 5
D 5
R 2
D 4
L 1
R 4
L 3
U 5
L 4
U 3
R 5
D 1
L 3
R 1
U 5
R 2
L 4
U 1
L 2
U 5
L 3
U 1
R 3
D 4
U 1
R 5
L 5
R 1
D 1
R 5
U 1
R 2
L 5
R 2
L 2
R 1
U 5
D 2
L 2
R 4
L 3
U 5
R 2
L 3
R 2
D 1
R 5
L 4
D 2
U 1
R 4
D 3
R 4
D 2
R 2
D 5
L 3
D 1
U 2
L 1
U 5
D 4
U 2
R 5
U 3
D 4
R 2
U 2
R 4
D 6
L 6
D 1
U 2
D 4
R 3
D 6
R 4
L 6
R 4
D 2
U 4
D 3
U 2
L 4
R 6
U 5
R 3
U 1
L 3
D 2
R 5
D 4
U 6
D 4
R 2
U 6
D 6
U 5
R 1
U 4
R 5
L 6
U 2
D 2
R 5
U 3
L 3
U 2
D 4
L 5
R 2
D 5
L 3
U 4
D 3
U 5
L 2
U 3
L 2
U 3
L 3
U 1
L 2
U 1
L 6
D 1
R 4
D 4
L 4
U 4
D 4
R 2
D 1
U 1
R 4
D 2
R 4
L 6
R 5
U 2
R 2
U 1
R 6
L 1
U 6
R 5
D 4
L 2
U 4
R 3
D 5
L 5
D 2
R 6
U 5
R 3
D 1
L 2
D 1
R 4
L 5
U 6
R 4
D 3
U 3
R 1
D 3
U 2
L 1
U 1
R 5
L 4
D 1
R 2
U 1
L 3
R 5
D 5
U 5
L 1
U 2
R 7
D 5
L 7
D 2
R 7
L 2
D 6
U 1
L 5
U 5
D 2
R 4
U 3
L 7
R 5
L 3
D 6
U 2
D 5
L 3
R 4
U 6
D 5
L 5
U 2
D 5
R 4
U 2
L 2
D 5
U 2
R 5
L 4
R 5
U 6
D 3
U 7
L 6
D 4
U 2
R 7
L 5
D 5
R 6
L 1
D 2
L 2
R 2
U 3
R 7
D 1
U 3
R 2
U 3
R 5
U 3
L 7
D 6
L 7
D 5
L 5
R 5
U 2
L 4
U 7
L 2
D 7
U 5
L 4
R 4
L 2
U 5
L 4
D 5
R 7
U 2
L 1
D 6
R 1
U 6
D 1
L 7
U 3
D 2
L 3
U 4
R 4
L 5
U 7
L 1
D 5
L 7
D 1
R 6
L 1
R 5
L 3
U 5
D 2
U 6
D 4
U 1
R 2
D 8
R 8
D 1
R 4
D 6
L 8
R 5
D 5
R 6
D 5
U 1
L 1
D 2
L 4
R 1
D 1
R 7
L 8
U 1
D 8
U 6
L 7
R 4
U 1
L 2
U 1
L 7
D 2
R 8
L 1
U 8
R 8
D 6
U 2
L 8
D 7
U 4
R 8
L 7
U 6
D 6
U 2
L 4
D 3
L 2
D 3
R 7
U 3
L 3
U 3
D 8
L 2
D 3
L 1
R 2
U 8
L 4
D 7
L 8
R 3
L 7
U 2
R 8
D 3
R 7
U 3
L 8
U 5
D 5
U 5
D 8
U 8
D 2
L 4
U 3
D 2
R 6
U 3
R 2
U 4
R 2
L 6
U 7
R 6
L 5
D 6
L 8
U 5
R 3
L 5
U 7
D 7
L 1
U 6
R 7
D 3
R 2
L 7
R 6
D 7
U 4
D 2
L 2
U 3
R 1
U 5
R 6
D 2
R 8
U 7
L 7
U 8
L 4
R 9
U 7
D 6
L 6
R 4
D 9
L 1
D 5
U 2
L 3
R 9
D 2
U 1
R 4
L 8
R 1
L 1
U 4
R 4
U 4
R 3
D 2
U 5
R 8
D 1
U 5
L 4
D 5
U 3
L 1
D 4
L 3
U 8
R 3
L 3
R 9
U 3
D 1
R 4
U 2
L 8
R 7
L 4
R 4
L 7
U 6
L 2
U 9
R 7
D 6
U 5
L 9
U 7
L 5
D 1
U 8
R 4
D 1
L 8
D 8
L 7
R 1
L 7
R 3
U 2
R 5
D 1
U 9
R 1
L 5
U 5
R 6
L 4
D 3
R 9
D 7
R 3
D 2
R 6
U 2
D 5
L 7
U 1
D 8
R 2
D 3
R 3
L 6
R 2
L 7
D 8
R 6
D 6
R 9
U 6
R 9
D 3
R 8
U 7
L 5
D 2
R 5
U 6
R 7
D 7
U 6
L 2
U 6
R 4
D 2
L 9
U 2
L 9
U 9
R 8
D 1
U 9
R 7
U 5
L 3
D 5
U 9
L 2
R 1
U 3
D 4
L 1
R 10
D 9
U 3
R 6
L 1
D 5
U 1
D 10
U 6
L 3
U 7
D 10
L 2
U 10
D 5
R 1
L 1
R 3
L 7
D 4
L 7
D 10
R 8
L 7
U 2
R 6
U 3
L 6
D 4
R 8
D 3
R 8
D 10
L 3
D 5
L 5
R 10
U 6
L 10
R 1
L 7
D 3
U 2
D 6
R 3
D 6
L 4
R 10
U 8
D 4
L 8
U 7
D 3
L 3
D 2
R 8
U 9
L 1
U 8
D 8
R 4
U 9
D 3
R 10
U 3
L 4
R 5
U 3
R 7
D 9
R 4
U 9
D 5
R 8
L 9
U 1
L 8
R 4
D 1
L 4
D 6
U 5
L 4
R 9
U 2
D 7
R 1
L 1
R 7
D 6
L 10
R 10
D 4
R 11
L 8
U 9
L 6
R 4
U 3
L 1
D 7
L 8
D 6
L 3
R 5
U 1
D 9
U 3
D 4
U 11
D 2
U 1
L 4
R 11
L 9
R 6
U 6
L 4
U 11
L 4
R 5
L 10
R 6
U 8
R 8
L 4
D 11
L 11
R 2
U 9
R 6
D 8
U 6
L 1
R 11
L 1
R 1
D 7
L 2
U 11
D 7
L 9
R 7
U 2
R 5
D 10
R 4
D 4
U 2
R 7
U 9
L 10
U 11
L 3
R 10
D 9
L 6
U 10
L 7
R 11
U 5
D 11
R 8
D 1
U 7
R 2
U 8
D 4
R 6
D 4
U 6
R 6
L 7
U 5
R 4
U 5
R 3
L 2
R 5
D 8
L 11
U 2
R 8
L 4
U 11
R 2
D 8
L 3
D 2
R 10
L 2
R 2
L 8
D 8
L 8
R 1
L 1
U 9
D 7
U 6
R 2
L 9
U 11
D 3
R 10
U 5
R 5
L 4
R 10
L 6
U 10
R 2
U 2
L 7
R 10
L 2
U 3
L 9
U 6
L 12
R 8
U 3
R 10
U 12
L 6
U 11
R 2
D 5
R 12
D 10
R 9
L 5
R 9
L 6
R 3
U 4
R 6
U 8
L 3
U 10
R 5
L 3
U 6
R 4
U 10
R 8
D 8
R 3
L 5
U 4
D 9
U 12
D 10
L 10
R 3
D 4
R 2
D 6
L 2
R 3
L 10
U 3
D 6
L 8
R 9
D 4
L 3
U 10
L 11
R 5
U 11
R 11
D 11
L 6
R 5
D 6
R 4
U 9
R 11
D 2
U 9
L 1
R 12
D 8
R 11
D 4
R 3
U 10
D 5
U 9
R 10
L 4
R 9
L 10
D 7
R 8
L 8
R 11
L 3
U 4
D 10
R 2
L 2
U 1
L 12
U 9
R 2
D 7
R 2
L 6
D 8
L 3
U 7
R 6
D 6
L 6
R 5
L 12
D 13
U 9
L 1
R 11
D 4
U 10
D 7
L 8
U 13
L 12
R 3
L 2
D 1
U 4
D 9
R 9
L 12
D 13
U 9
R 8
L 3
U 2
L 1
U 12
D 12
U 5
L 5
U 10
R 3
D 8
R 10
L 9
R 1
U 4
D 12
R 11
U 8
L 9
U 10
R 8
U 13
D 13
U 10
D 5
R 6
U 11
R 4
U 6
L 2
U 13
L 2
U 8
R 13
U 4
D 5
U 3
R 8
U 8
L 6
U 11
R 10
U 8
D 8
L 10
D 9
U 13
R 12
L 10
R 3
U 3
D 10
R 3
D 3
L 6
R 3
U 5
L 3
R 10
D 6
L 10
D 10
R 13
D 1
R 9
L 7
D 12
U 6
R 4
L 1
U 7
L 8
U 7
L 11
U 11
D 1
U 5
R 2
D 1
L 9
U 13
R 10
L 3
R 9
D 10
R 10
U 2
L 4
R 5
L 12
R 7
D 7
R 9
D 6
L 10
D 12
R 10
D 9
L 13
R 13
L 3
U 6
D 8
L 7
R 4
U 7
L 10
D 8
R 12
L 3
R 6
L 14
R 7
L 4
U 8
D 10
L 9
D 10
R 6
L 5
R 8
U 13
L 2
R 13
L 10
D 12
U 4
R 1
D 1
R 10
L 9
R 12
U 10
D 4
L 3
R 7
D 13
L 11
D 3
U 11
D 12
U 4
R 11
D 9
R 3
D 14
U 3
L 10
D 5
L 14
R 13
L 12
D 14
R 2
U 13
D 10
L 13
U 11
R 9
D 4
L 13
U 13
R 5
L 1
R 14
D 4
U 8
D 2
R 2
U 6
D 10
L 1
U 9
R 7
D 2
L 13
R 8
L 12
R 12
U 8
L 14
D 11
R 6
L 5
R 10
U 5
D 12
L 6
U 13
R 3
D 8
U 11
L 7
D 5
R 12
D 8
R 13
L 9
U 4
D 3
L 3
D 15
L 14
U 2
L 10
R 14
U 1
D 11
L 2
R 11
L 12
R 7
L 4
U 15
D 15
R 9
L 9
R 1
D 11
L 1
U 3
R 12
D 7
U 2
D 6
R 1
D 13
R 3
U 10
D 4
L 6
U 8
L 8
D 7
L 6
U 15
D 7
U 1
D 1
L 14
D 3
U 10
L 2
U 14
D 2
L 5
R 3
U 1
D 13
U 13
D 9
L 12
R 5
L 14
U 3
D 11
R 9
U 8
D 5
R 3
L 13
U 2
L 10
D 3
U 2
L 12
D 13
R 14
U 10
D 8
L 8
R 14
L 6
D 14
L 8
R 15
D 10
R 1
L 2
D 6
L 9
R 1
L 4
D 9
U 8
L 1
R 9
L 1
D 5
L 6
U 9
L 6
R 3
U 5
R 12
D 6
R 8
D 3
U 13
D 2
U 2
L 4
U 11
R 4
L 13
U 6
L 12
U 4
D 6
U 11
D 5
U 8
L 10
D 13
L 5
U 15
L 4
R 12
D 1
L 9
U 8
L 4
U 8
D 10
U 12
L 12
D 5
R 10
D 3
U 1
L 6
R 10
L 5
D 8
U 8
D 8
R 6
U 13
D 8
L 16
R 11
L 14
D 15
R 15
L 8
D 1
U 6
D 15
R 9
L 12
D 13
U 9
D 15
L 6
R 9
U 8
D 15
U 7
L 4
R 9
D 2
R 5
U 6
D 14
L 11
D 9
R 2
U 12
L 2
R 15
U 2
L 15
R 9
U 6
L 2
D 4
U 1
L 13
D 5
R 14
D 1
R 13
U 9
R 5
L 4
U 9
D 6
U 7
R 16
D 11
U 8
R 13
D 7
L 12
D 8
U 15
D 11
U 14
L 14
U 10
L 8
R 16
L 3
U 13
D 5
L 2
R 8
L 10
D 6
R 15
D 11
U 3
D 12
R 12
L 15
U 13
L 14
D 2
R 6
L 5
R 2
U 2
D 11
U 14
L 9
R 14
D 17
R 10
D 1
U 11
L 3
U 1
D 17
L 10
R 6
L 14
U 4
D 2
U 17
L 2
R 10
D 14
L 5
U 7
D 7
R 13
U 9
D 9
U 7
D 17
U 15
D 1
L 4
D 11
L 16
U 8
L 6
R 5
L 9
D 14
L 13
D 11
R 3
L 15
D 9
L 10
D 11
L 11
U 2
L 17
D 10
R 13
L 11
U 16
L 8
U 5
D 7
U 11
D 1
L 17
U 12
L 4
R 12
U 4
R 10
L 4
U 11
D 8
L 5
D 6
U 4
D 16
U 6
D 12
L 3
U 3
L 16
R 2
U 14
R 1
L 14
U 11
L 7
D 11
R 2
D 2
L 6
U 10
L 10
D 15
R 12
D 16
L 3
U 15
R 15
D 17
U 17
L 13
R 5
D 12
L 9
R 10
D 4
L 2
D 14
U 8
R 6
U 5
D 1
L 11
R 12
L 17
U 2
L 17
D 2
R 17
L 17
U 3
D 14
U 8
L 14
D 12
R 17
L 18
D 3
U 10
L 7
U 10
R 5
L 15
D 10
L 3
R 12
D 10
U 6
L 17
D 9
U 18
R 7
U 1
D 1
L 9
U 2
L 5
U 9
L 8
U 17
D 17
L 17
D 15
R 13
U 15
D 8
R 13
D 17
L 18
R 5
D 7
R 6
D 1
R 3
L 10
U 10
D 12
L 8
R 11
U 6
R 5
L 9
R 6
U 15
D 4
R 8
U 1
R 18
L 18
U 10
R 17
D 10
R 10
U 16
R 16
U 5
R 7
D 15
U 15
R 2
U 17
L 14
R 1
U 2
L 10
R 17
L 14
U 13
D 1
L 16
D 4
U 9
L 17
U 9
D 9
L 18
D 9
U 5
L 18
U 6
L 5
U 10
L 18
D 13
R 8
L 17
U 9
L 14
D 12
U 2
D 5
U 2
D 17
L 18
R 8
L 7
R 1
D 13
R 11
D 10
R 18
D 2
U 17
D 17
L 4
R 16
D 16
L 2
D 5
R 4
U 9
R 6
D 7
L 13
U 19
R 7
U 17
L 9
U 6
D 1
L 19
U 7
R 6
L 11
R 12
D 6
L 17
R 18
D 17
L 2
D 8
U 15
D 13
L 10
D 10
L 17
D 4
L 12
U 11
L 3
D 6
U 18
R 18
U 16
L 5
D 9
R 17
L 17
D 16
R 12
D 18
U 14
R 1
U 12
R 4
L 6
U 14
R 18
D 6
U 2
D 13
U 15
L 14
R 3
D 7
L 6
D 15
U 17
L 12
D 2
L 12
R 10
L 16
D 15
L 18
U 9
L 7
U 13
R 11
U 9
L 4
U 12
R 14
D 11
R 8
U 4
L 17
R 14
D 15
R 1
U 5
R 3
L 4
R 9
U 1
D 10
R 3
U 16
D 6
L 1
U 15
D 9
U 10
L 11
U 7
L 5
D 19
L 8
U 10
L 19