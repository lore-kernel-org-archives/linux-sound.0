From: Benno Senoner <sbenno@gardena.net>
Date: Thu, 28 Oct 1999 00:16:29 +0000
Subject: Re: HZ > 100 overhead
Message-Id: <marc-linux-sound-94107122601331@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94104909204283@msgid-missing>
In-Reply-To: <marc-linux-sound-94104909204283@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 28 Oct 1999, Paul Barton-Davis wrote:
> >In our upcoming multimedia API we will run the audio daemon
> >not only for providing PCM/MIDI services but precise timers too.
> 
> i hate to go on about this, but MIDI only programs shouldn't need to
> depend on audio services to work. i might even want to run a MIDI
> interface on a machine with no audio card at all - its hard to find an
> argument to be using an audio daemon under such circumstances.
> 
> thats why i like eric's suggestion for an rtcd that can be used by
> programs that want precise-ish timing *but have no option to do
> audio-based timing* because they don't deal with audio. any program
> that does its own audio output or input in small fragments has its own
> built-in source of precise timing, but not every interesting program
> works that way.
> 
> --p

Of course I agree,  that you are not forced to run the audio server
all the time.
Do you remember the discussion some time ago ?
"the client can access the device directly or use the audio server"
"the client can do his own plugin hosting, or delegate the hosting to the audio
server"

In the case of the timer I'd opt for a similar solution.

( note that in my case the rtcd is a subsystem of the audio (or better
multimedia) engine )

I'm not sure if it is convenient to run the audioserver and rtcd in 2 separate
threads or if it's better to do all stuff in a single process (less scheduling
overhead ?)

The API should provide calls that let you allocate timers similar to the RTC
device, but where you can specify if the system is forced to use the RTC device
(in this case rtcd is used), or if you need only a generic timer with better
than x ms granularity.
In that case the engine could optimize and if it sees that PCM is runnnig (with
small fragments) , it could just use this timing source and wake up your app
when needed (via FIFO, socket etc.)

From an API point of view it should make no difference,
the client simply allocates a timer ressource , (with the possibility to
force some specific timer "ie I want to use RTC because I need 8192HZ
precision").


IMHO the advantage to integrate the rtcd into the multimedia engine
(which of course works on machines without soundcards) , is that 
the system can optimize things when multiple timer sources are available.

We could even provide a way where the client "hosts" the timer in his own
thread, (like by your SIGIO notification), or by simply providing an RTC
wrapper, but with an uniform API.
That means if you run your Softwerk sequencer standalone (using the MIDI
device / timers  directly  (in this case the timer is managed though the
wrapper) ) ,
will work as well as when running it as a client to the multimedia engine:
MIDI events are feed to the engine via MIDI "pipe" to the server,
and timers are managed by the server.
= server wakes you up using the optimal method (or your preferred if you
forced this during the timer allocation) ).

efficient and flexible.

comments ?

Benno.
