From: Paul Barton-Davis <pbd@Op.Net>
Date: Wed, 27 Oct 1999 17:55:58 +0000
Subject: Re: sequencer timing issues
Message-Id: <marc-linux-sound-94104695800934@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94104534231553@msgid-missing>
In-Reply-To: <marc-linux-sound-94104534231553@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

  [ why softwerk can't use a kernel sequencer ]

>Hmm..sounds like you're already paying much of the price of the
>hyperseq approach..might as well go all the way. :)

thats the plan, just as soon as i:

      * finish autoconf-izing Quasimodo
      * fix Quasimodo's audio input system
      * finish writing a prototype of my take on the plugin API
      * port the ALSA CS4231 driver to pcm-v2
      * port SoftWerk to Gtk--

etc. etc. :)

>> in SoftWerk's case, because it doesn't process audio data in any way,
>> I use sigitimer(2) to give me a periodic async signal every so often
>> (typically 20-100ms: its controllable in the UI). i use this to
>> measure the passage of time, and compute when a beat/tick is
>> happening.  soon, i will use the RTC with select(2), which will be
>> more accurate and permit much faster tempos than sigitimer can.
>
>Wouldn't you say that an HZ > 100 kernel is the cleanest solution?

its the cleanest, but not the best. HZ = 1000 adds about 8% overhead
to IRQ processing *all the time*. and even then, the system timer is
only accurate to 1ms, which is still not adequate for some envisioned
uses of SoftWerk (though given its use of h/w MIDI ports and the speed
of MIDI communication, its pretty excellent for 99% of them :)

--p
