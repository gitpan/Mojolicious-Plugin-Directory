use Mojo::Base qw{ -strict };
use Mojolicious::Lite;

use File::Basename;
use Mojo::Home;
use Encode ();

my $dir = dirname(__FILE__);
plugin
    'Directory',
    root      => Mojo::Home->new($dir)->rel_dir('dir'),
    dir_index => [qw/index.html index.htm/];

use Test::More tests => 3;
use Test::Mojo;

my $t = Test::Mojo->new();
$t->get_ok('/')->status_is(200)->text_is('body' => 'Hello World');
