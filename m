From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Fri, 27 Aug 1999 12:31:05 +0000
Subject: Re: sound card overhead?
Message-Id: <marc-linux-sound-93575780920189@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93574912312253@msgid-missing>
In-Reply-To: <marc-linux-sound-93574912312253@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

James Stevenson wrote:

> i was just wondering about this
> how much difference will a sound card make
> which seems to be generating 600/700 interuppts a second
> to the rest of the system performance?

The application can basically tune how many interrupts
the soundcard will generate by setting the fragment size.

My drivers will allow only root to generate more than 100/s,
and the default is somewhere between 50 and 100/s.

Tom
