#!/usr/bin/perl

my $testval = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections and of de Finibus Bonorum et Malorum The Extremes of Good and Evil by Cicero written in 45 BC This book is a treatise on the theory of ethics very popular during the Renaissance The first line of Lorem Ipsum Lorem ipsum dolor sit amet comes from a line in section";
#my $testval = "Nunc laoreet feugiat ante at volutpat. Nam metus velit, molestie ut erat ac, ornare auctor libero. Nullam quis dui enim. Quisque quis viverra sapien. Mauris vitae consectetur ex. Vivamus et fermentum dui. Morbi sollicitudin aliquam libero, a lobortis nunc viverra non. Maecenas sem nibh, accumsan vel mauris in, luctus faucibus urna. Cras lacinia ac nisl eget scelerisque. Donec dolor elit, ultrices non ligula et, eleifend placerat lorem. In euismod vehicula ullamcorper. Duis nec iaculis purus. Nunc dui purus, sagittis id porttitor at, efficitur ut augue. Nam imperdiet lacus vitae nisl blandit ornare.";
#my $testval = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus molestie dui non condimentum accumsan. Nulla mattis, nisl quis tincidunt vestibulum, nisi ante euismod nunc, eget cursus justo nibh sed eros. Phasellus in bibendum ligula. Nullam gravida ex iaculis nisi gravida, ut pharetra diam molestie. Nunc consectetur, elit a facilisis laoreet, nunc risus malesuada lectus, et tincidunt ante odio nec elit. Cras maximus libero nunc, auctor tincidunt diam efficitur eget. Maecenas dapibus non felis in tempor. Aliquam lobortis ex iaculis dui ultricies, quis commodo nulla dapibus. Sed eu tempor justo. Nunc in mollis ex, et lobortis nibh. Quisque maximus ipsum et ipsum interdum, a dictum ante commodo. Aenean eget feugiat elit, in commodo ex. Aenean eget libero tincidunt, porttitor sapien eget, finibus turpis. In in diam molestie, vulputate purus sed, ultricies ligula. Nunc pellentesque finibus sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.";
#my $testval = "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?";
#my $testval = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
#my $testval = "Banana Boat baby buggy coat hugging tugging lugging chugging bottle goat boar soar";
#my $testval = "Banana Boat";

my %results;
my $tstring;

sub solution
{
    my ($S) = @_;
    $tstring = lc($S); #Shift the string to lower case

    #Find every individual character in the tstring to seed the search
    foreach my $tval (sort(split(//, $tstring)))
    {
        next if $tval =~ /\W+/;
        $results{$tval} = 1; #This is just a placeholder, we'll count them later
    }

    findcombos(keys(%results)); #Search for every combination that starts with the individual letters we've found

    foreach my $tkey (keys(%results))
    {
        $results{$tkey} = () = $tstring =~ /$tkey/g; #Find every combination of the tkey and put the count in the hash
    }

    foreach my $tkey (sort {$results{$b} <=> $results{$a}} sort(keys(%results)))
    {
        next if ($tkey =~ /\W+/);
        print("$results{$tkey}: $tkey\n");
    }
}

#Recursively search the tstring for elements of the array + 1 character
sub findcombos
{
    my @tkeys = @_;

    foreach my $tkey (@tkeys)
    {
        my @vkeys = $tstring =~ /($tkey\w)/g; #Find every combination of the tkey plus one character and put it in a temp array

        foreach my $vkey (@vkeys)
        {
            $results{$vkey} = 1; #Make sure there is a hash element with key (we'll count them later)
        }

        findcombos(@vkeys); #Lets search for more combinations of these keys
    }
}

solution ($testval);