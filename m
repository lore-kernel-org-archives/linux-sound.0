From: Benno Senoner <sbenno@gardena.net>
Date: Fri, 27 Aug 1999 14:10:51 +0000
Subject: Re: sound card overhead?
Message-Id: <marc-linux-sound-93576305126360@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93574912312253@msgid-missing>
In-Reply-To: <marc-linux-sound-93574912312253@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 27 Aug 1999, James Stevenson wrote:
> Hi
> 
> i was just wondering about this
> how much difference will a sound card make
> which seems to be generating 600/700 interuppts a second
> to the rest of the system performance?
> 
> thanks
> 	James

I ran my stresstests with fragments of 1.5ms = about 600 interrupts/sec on
my PII box + SB AWE64 , I can't feel a big system slowdown,
it works just fine.
(Maybe you can measure it, by running some CPU bound benchmark while
playing audio)

regards,
Benno.
