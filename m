From: John Lazzaro <lazzaro@CS.Berkeley.EDU>
Date: Sat, 17 Jun 2000 18:33:03 +0000
Subject: Re: [linux-audio-dev] Re: Multimedia compression
Message-Id: <marc-linux-sound-96126686903146@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


> OTOH, one way to achieve great compression with little distorsion would be 
> decomposing the audio stream in it's elementary "instruments", like
> drumset , guitars ,violines , bass etc, and then code a sort of MIDI-like file
> (very short) with the "samples" stored in the stream only once.
>
> I think MP4-SAOL is a step in that direction.

Basically, there's two interrelated research agendas, both of which need
to make it out of the lab for this sort of compression to make it to the
real world: 

[1] Doing the decomposition. The three major ways people are thinking about
solving this problem right now are 

  [A] The mathematical approach -- in a nutshell "Let's separate out N 
      signals from one, under the assumption that the best separation
      makes each separated signal carry unique information. The best
      starting point for understanding how these folks think about 
      the problem is:

      http://www.cnl.salk.edu/~tony/ica.html

      While many of these papers think in terms of "N microphones to 
      listen to a performance of N instrumentalists" as the starting
      signal, this is just to make the math easier -- in practice the
      ideas can be extended to the more general case.

  [B] Auditory scene analysis -- in short, take the analogy from computer
      vision, where raw camera (or retina) output gets broken up into 
      different "maps" coding motion, color, shape, ect, and apply it 
      to audition. These maps should (in theory) make the process of 
      doing separation a lot easier. The good initial resource for
      this approach is:

      http://sound.media.mit.edu/~dpwe/AUDITORY/

  [C] Get access to the 24-track master tapes (uh, I think I just dated
      myself :-), and avoid the whole decomposition problem. Technically
      easy, of course, but might not be practical.

[2] Once you've done the decomposition, create encoders specialized for
specific types of sounds. For certain types of specialized sounds, this
field is very mature (i.e. spoken speech). For other types of sounds,
though, you're basically going to have to

   [1] Look at the best music synthesis algorithms for the sound type,
       and see how easily the algorithm can be "inverted".

   [2] Hope a speech codec works well on the sound (there are a few 
       codecs specialized for singing voice that take this approach ...).

   [3] Do original research on the problem.


One big problem with a field like this is that its hard to get people
motivated to work on the "little problems" described above, if its 
unclear how success on the little problem is going to solve any big 
problem. The hope with Structured Audio is to solve this "meta-problem" --
by having a fielded platform out there, ready to support new approaches
to sound encoding in pilot applications, SA will help motivate research
in the whole area.

In particular, the politics of MPEG is very different than the politics
of IETF -- "joining the process" of creating a new coding standard is
a deep committement of time and resources and money in MPEG-land (note
that I'm not an MPEG member, so I'm outside the process, largely because
of the committment it takes to meaningly participate). But implementing a
new codec _in_ Structured Audio is a whole different ballgame -- you could
get a team together under the rubric of the IETF, or you could just take
the traditional Free Software approach and start a grass roots effort like
LAD. You don't need anyone's permission to write a SAOL program ...

									--jl

-------------------------------------------------------------------------
John Lazzaro -- Research Specialist -- CS Division -- EECS -- UC Berkeley
lazzaro [at] cs [dot] berkeley [dot] edu     www.cs.berkeley.edu/~lazzaro
-------------------------------------------------------------------------
