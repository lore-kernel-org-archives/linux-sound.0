From: Bill Nottingham <notting@redhat.com>
Date: Thu, 22 Apr 1999 02:05:26 +0000
Subject: Re: why no midi?
Message-Id: <marc-linux-sound-92474733308093@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92467332609462@msgid-missing>
In-Reply-To: <marc-linux-sound-92467332609462@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

qozmo x xx (qozm0@juno.com) said: 
> all of these files already had these permissions on them, but i tried it
> anyway, and nothing changed.  is there any other reason that might be why
> my midi stuff isn't working?

playmidi as shipped in RH 5.2 is broken for FM synth; either upgrade
to a later release, or do:

cd /etc/midi
for foo in *; do ln -s midi/$foo ../$foo ; done

That should fix the problem.

Bill
