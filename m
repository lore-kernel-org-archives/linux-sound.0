From: "llornkcor" <llornkcor@llornkcor.com>
Date: Fri, 22 Oct 1999 16:18:11 +0000
Subject: Re: SB PCI128 mixer problems ( can't deactivate input passthru)
Message-Id: <marc-linux-sound-94061299013727@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94060417102142@msgid-missing>
In-Reply-To: <marc-linux-sound-94060417102142@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I also use ossmixer, which allows you to select the input or mute it. If you
right click on the kmix channel, you can do the same, I think.

| Hi,
| I'm running the a Redhat 6.1 box with Soundblaster PCI128,
|
| PCM input/output works well,
| except that I am unable to deactivate microphone input passthru on the
output,
|  that means when record from the MIC I can always hear the dry signal on
the
| output which is very disturbing , especially when doing realtime
processing.
|
| I tried with both xmixer and kmix, no luck !
|
| any advice ?
|
| regards,
| Benno.
