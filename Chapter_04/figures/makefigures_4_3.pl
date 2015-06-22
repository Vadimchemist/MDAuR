#!/usr/bin/perl

use Image::Magick;

$image = Image::Magick->new;
$image->Set(size=>'6000x3800');
$image->ReadImage('xc:white');

$text = "ASCII characters:\n".'  !"#$%%&'."'".'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[ ]^_`abcdefghijklmnopqrstuvwxyz{|}~'."
                
  |                         |    |        |                              |                     |
 33                        59   64       73                            104                   126

Sanger          
  +++++++++++++++++++++++++++++++++++++++++.....................................................
Phred+33:     
  0........................26...31.......40                                

Solexa          
  ..........................++++++++++++++++++++++++++++++++++++++++++++++......................
Phred+64:      
                           -5....0........9.............................40 

Illumina 1.3+   
  ...............................+++++++++++++++++++++++++++++++++++++++++......................
Phred+64:      
                                 0........9.............................40 

Illumina 1.5+   
  ..................................++++++++++++++++++++++++++++++++++++++......................
Phred+64 0, 1, 2: special meaning:
                                    3.....9.............................40 

Illumina 1.8+   
  ++++++++++++++++++++++++++++++++++++++++++....................................................
Phred+33 extended upper limit:  
  0.2......................26...31........41                              
";

$image->Annotate( text=>$text, font=>'/usr/share/fonts/liberation/LiberationMono-Regular.ttf', fill=>'black', pointsize=>'100', geometry=>'+70+300' );
$image->Write( 'figure4_3.tif' )
