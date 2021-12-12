sub silent_prompt {
    require Term::ReadKey;

    # Do not show typed chars
    Term::ReadKey::ReadMode('noecho');

    print "Enter your password: \n";
    my $password = Term::ReadKey::ReadLine(0);

    # Reset the terminal
    Term::ReadKey::ReadMode('restore');

    # This should print zilch!
    print "\n";

    # get rid of line ending (works on Windows, too!)
    $password =~ s/\R\z//;

    # say "Password was <$password>"; # check what you are doing :)

    return $password;
}

silent_prompt;
