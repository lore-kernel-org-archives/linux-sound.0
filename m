From: Paul Barton-Davis <pbd@Op.Net>
Date: Wed, 27 Oct 1999 23:59:09 +0000
Subject: Re: HZ > 100 overhead
Message-Id: <marc-linux-sound-94106874932014@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94104909204283@msgid-missing>
In-Reply-To: <marc-linux-sound-94104909204283@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>In our upcoming multimedia API we will run the audio daemon
>not only for providing PCM/MIDI services but precise timers too.

i hate to go on about this, but MIDI only programs shouldn't need to
depend on audio services to work. i might even want to run a MIDI
interface on a machine with no audio card at all - its hard to find an
argument to be using an audio daemon under such circumstances.

thats why i like eric's suggestion for an rtcd that can be used by
programs that want precise-ish timing *but have no option to do
audio-based timing* because they don't deal with audio. any program
that does its own audio output or input in small fragments has its own
built-in source of precise timing, but not every interesting program
works that way.

--p
