From: Etienne Grossmann <etienne@anonimo.isr.ist.utl.pt>
Date: Fri, 04 Dec 1998 18:34:16 +0000
Subject: Announce: alpha silly sound game
Message-Id: <marc-linux-sound-91285080814759@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



  Hello,

  I have written a musical "game".
                              \_ with  quotes, because it isn't 
                                 very much fun.

 The rules are : the computer plays a succession of chords, and for
each, the player should say if the chord was a minor or a major. Good
answers give points, bad ones remove a "life" (you start with 3). 

  The chords are played within a single key, so it is (theoretically)
possible for the hearer to say the height (from 1 to 7) of the chord
in that scale. If the player guesses rightly the height, he gets
rewarded (and he loses a life he guesses wrongly).

  Now and then, the key changes, and if the hearer hears it, he can
say it too.

  There are a GTK and a plain terminal interface.


  On the "install" side, it may requires some work : it needs the
following programs

- abc2midi, in a version that allows it to take input from stdin. The
  authors of abc2midi make that feature available simply by commenting
  2 lines of code, in the 1.6 release. I know the "Debian 2.0"
  abc2midi does not have this feature. It should be at :
  http://perun.hscs.wmin.ac.uk/~jra/abcMIDI/ 
  
- playmidi : I use 2.3. The standard version should be ok, but the
  sound seems better with a home-patched version (this may depend on
  my sound setup, though).

- Perl, with module "Time::HiRes" installed; module "Gtk" is needed
  for the Gtk interface. 


  If anyone is interested, I'd be glad to put it all in a tarball for
him/her to try it out


  Cheers,


  Etienne
