From: Benno Senoner <sbenno@gardena.net>
Date: Fri, 29 Oct 1999 00:02:09 +0000
Subject: Re: [linux-audio-dev] Re: HZ > 100 overhead
Message-Id: <marc-linux-sound-94118118519929@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94113791209316@msgid-missing>
In-Reply-To: <marc-linux-sound-94113791209316@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 28 Oct 1999, Paul Barton-Davis wrote:
> 
> take a system in which, say, Quasimodo was running through the server
> or was the server and SoftWerk ran along side it. SoftWerk doesn't
> talk to the audio h/w at all, but it wants timing from the RTC. the
> server might want timing from the RTC. a 3rd program runs and wants to
> to use the RTC for something completely non-audio related.
> 
> in these kinds of situations, you don't want to have merged RTC
> service into an "multimedia server" - someone who wants to use the RTC
> for something completely different is going to be unhappy at being
> forced to connect to the multimedia server if the server is running
> (and thus owns the RTC).


> 
> that's why I think that the RTC *must* be considered a standalone
> system utilized either by a single (greedy) application, or by a
> server *that does nothing else* but distribute timing info to clients.

You convinced me  :-) 
Agreed, rtcd will run as standalone app and 
the multimedia API will provide a timerwrapper which connects
to rtcd if requested , ok ?

Benno.
