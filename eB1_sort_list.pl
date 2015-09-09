# 
# 7661СЃ
# 34775Он species
#
#------------------------------------------------------

#$locus="matK";
$locus="rbcL";
my $iname=sprintf "%s_rpsv.list",$locus;
my $oname=sprintf "eB1_slist_%s.txt",$locus;

my %id;
open(FP,"$iname")or die;
while(<FP>){
	chomp;
	@dat=split(/\t/,$_);
	@tmp=split(/\s/,$dat[1]);
	
	$id{$dat[1]}=$tmp[0];
	
	
}
close(FP);

#---------------------------------------------------

$nn=1;
open(FOUT,">$oname")or die;

$back='';
$key_new=0;
foreach $key (sort keys %id){

	unless ($back eq $id{$key}){
		$key_new++;	
	}

	printf "%d\t%d\t%s\n",$nn,$key_new,$key;
	printf FOUT "%d\t%d\t%s\n",$nn,$key_new,$key;
	
	#update
	$back=$id{$key};
	
	$nn++;
}

close(FOUT);

#-------------------------------------------