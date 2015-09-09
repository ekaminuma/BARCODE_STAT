#
#
#
my %id;
open(FP,"eB1_slist_matK.txt")or die;

while(<FP>){
	chomp;
	@dat=split(/\t/,$_);
	@tmp=split(/\s/,$dat[2]);
	
	unless (exists $id{$tmp[0]}){
		$id{$tmp[0]}=1;
	}else{
		$id{$tmp[0]}=$id{$tmp[0]}+1;
	
	}
	
}
close(FP);

#---------------------------------------------------
$nn=1;
open(FOUT,">eB3_genus_count.txt")or die;
foreach $key (sort {$id{$b}<=>$id{$a}} keys %id){
	printf "%d %s %d\n",$nn,$key,$id{$key};
	printf FOUT "%d\t%s\t%d\n",$nn,$key,$id{$key};	
	$nn++;
}
close(FOUT);
#----------------------------------------------------