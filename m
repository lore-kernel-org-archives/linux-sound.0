From: Hannu Savolainen <hannu@opensound.com>
Date: Sun, 14 Mar 1999 21:26:56 +0000
Subject: Re: awe64 not initializing on 2.2.2
Message-Id: <marc-linux-sound-92144914027701@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92139407200837@msgid-missing>
In-Reply-To: <marc-linux-sound-92139407200837@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 15 Mar 1999, Erik de Castro Lopo wrote:

> /dev/audio is for Sun .au format files only.
Actually /dev/audio doesn't know anything about .au format. Most (older)
.au files just happen to be recorded using the right format (because it
was the only format possible with oldest Sparc machines). However there
are lot of .au files that don't play properly when catting them to
/dev/audio.

So the proper solution for .au files too is using a player program that
understand the format.  

Best regards,

Hannu
-----
Hannu Savolainen (hannu@opensound.com)
http://www.opensound.com (Open Sound System (OSS))
http://www.opensound.com/ossfree (OSS/Free)
